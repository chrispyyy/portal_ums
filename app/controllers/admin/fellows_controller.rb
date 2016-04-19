class Admin::FellowsController < ApplicationController

  include SortedColumns

  before_action :require_cohort
  before_action :require_fellow, only: [:edit, :update, :show, :destroy]

  # scope :for_cohort,  -> (cohort) { where(cohort_id: cohort) }

  def new
    @fellow = @cohort.fellows.new
    @locale = @fellow.locales.build
  end

  def create
    @fellow = @cohort.fellows.new(fellow_params)
    if params[:add_locale]
      # add empty location associated with @fellow
      @fellow.fellows.build
    elsif params[:remove_locale]
      # nested model that have _destroy attribute = 1 automatically deleted by rails
    else
      # save goes like usual
      if @fellow.save
        redirect_to admin_cohort_path(@cohort), notice: "Member #{@fellow.full_name} was created"
      else
        render :new
      end
    end
  end

  # def index
  #   # @fellow = Fellow.order(sort_column + " " + sort_direction)
  #
  #   if params[:cohort_id].present?
  #     if params[:cohort_id] == '0'
  #       @fellow = @fellow.for_cohort(nil)
  #     elsif cohort = Cohort.find_by(id: params[:cohort_id])
  #       @fellow = @fellow.for_cohort(cohort)
  #     end
  #   end
  # end

  def show
  end

  def edit
    @fellow = Fellow.find(params[:id])
  end

  def update
    @fellow = Fellow.find(params[:id])
    # if @fellow.update_attributes(fellow_params)
      if params[:add_locale]
         # rebuild the locale attributes that doesn't have an id
         unless params[:fellow][:locales_attributes].blank?
           for attribute in params[:fellow][:locales_attributes]
             @fellow.locales.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
           end
         end
        # add one more empty locale attribute
        @fellow.locales.build
      elsif params[:remove_locale]
        # collect all marked for delete locale ids
        removed_locales = params[:fellow][:locales_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
        # physically delete the locales from database
        Locale.delete(removed_locales)
        flash[:notice] = "Locales removed."
        for attribute in params[:fellow][:locales_attributes]
          # rebuild locales attributes that doesn't have an id and its _destroy attribute is not 1
          @fellow.locales.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
        end
      else
        # save goes like usual
        if @fellow.save
          # flash[:notice] = "Successfully updated fellow."
          redirect_to admin_cohort_path(@cohort), notice: "Member #{@fellow.full_name} was successfully updated."
        end
      end
    # end

  end

  def destroy
    if @fellow.destroy
      redirect_to admin_cohort_path(@cohort), notice: "Member #{@fellow.full_name}'s record was deleted"
    else
      # redirect_to admin_cohorts_path, alert: "Delete failed: #{@fellow.errors.full_messages.first}"
      render :show
    end
  end

  def add_locale
    @fellow = @cohort.fellows.find(params[:id])
    @fellow.locales.build
    render :edit
  end


  protected

  def fellow_params
    params.require(:fellow).permit(
      :first_name,
      :last_name,
      :email,
      :cohort_id,
      locales_attributes: [:id, :city, :country, :period, :_destroy]
    )
  end

  def require_cohort
    @cohort = Cohort.find params[:cohort_id]
  end

  def require_fellow
    @fellow = @cohort.fellows.find(params[:id])
  end

  # def sort_column
  #   Fellow.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  # end

end
