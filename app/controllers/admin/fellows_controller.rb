class Admin::FellowsController < ApplicationController

  include SortedColumns

  before_action :require_fellow, only: [:edit, :update, :show, :destroy]
  before_action :prep_form

  # scope :for_cohort,  -> (cohort) { where(cohort_id: cohort) }

  def new
    @fellow = Fellows.new
  end

  def create
    @fellow = Fellow.new(fellow_params)
    if @fellow.save
      redirect_to admin_fellows_path, notice: "#{@fellow.full_name} was successfully created"
    else
      prep_form
      render :new
    end
  end

  def index
    @fellows = Fellow.all
    @fellows = Fellow.order(sort_column + " " + sort_direction)
  end

  def show
  end

  def edit
  end

  def update
    if @fellow.update_attributes(fellow_params)
      redirect_to admin_fellows_path
      return
    else
      prep_form
      render :edit
    end
  end

  def destroy
    if @fellow.destroy
      redirect_to admin_fellows_path, notice: "#{@fellow.full_name} was deleted"
    else
      redirect_to admin_fellows_path, alert: "#{@fellow.full_name} can't be deleted because there are applications"
    end
  end
  #
  # def add_locale
  #   @fellow = @cohort.fellows.find(params[:id])
  #   @fellow.locales.build
  #   render :edit
  # end


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

  def require_fellow
    @fellow = Fellow.find(params[:id])
  end

  def prep_form
    @cohorts = Cohort.all
  end

  def sort_column
    Fellow.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

end
