class Admin::FellowsController < ApplicationController

  include SortedColumns

  before_action :require_cohort
  before_action :require_fellow, only: [:edit, :update, :show, :destroy]

  # scope :for_cohort,  -> (cohort) { where(cohort_id: cohort) }

  def new
    @fellow = @cohort.fellows.new
  end

  def create
    @fellow = @cohort.fellows.new(fellow_params)
    if @fellow.save
      redirect_to admin_cohort_path(@cohort), notice: "Member #{@fellow.full_name} was created"
    else
      render :new
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
  end

  def update
    if @fellow.update_attributes(fellow_params)
      redirect_to admin_cohort_path(@cohort), notice: "Member #{@fellow.full_name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @fellow.destroy
      redirect_to admin_cohort_path(@cohort), notice: "Member #{@fellow.full_name}'s record was deleted"
    else
      # redirect_to admin_cohorts_path, alert: "Delete failed: #{@fellow.errors.full_messages.first}"
      render :show
    end
  end

  protected

  def fellow_params
    params.require(:fellow).permit(
      :first_name,
      :last_name,
      :email,
      :cohort_id
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
