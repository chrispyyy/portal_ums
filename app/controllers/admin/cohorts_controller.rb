class Admin::CohortsController < ApplicationController

  include SortedColumns

  before_action :load_cohort, only: [:show, :edit, :update, :destroy]
  before_action :prep_form, only: [:new, :edit]

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to admin_cohorts_path, notice: "#{@cohort.name} was successfully created"
    else
      prep_form
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cohort.update_attributes(cohort_params)
      redirect_to admin_cohorts_path
    else
      prep_form
      render :edit
    end
  end

  def index
    @cohorts = Cohort.order(sort_column + " " + sort_direction)
  end

  def destroy
    if @cohort.destroy
      redirect_to admin_cohorts_path, notice: "#{@cohort.name} was deleted"
    else
      redirect_to admin_cohorts_path, alert: "Delete failed: #{@cohort.errors.full_messages.first}"
    end
  end

  protected

  def cohort_params
    params.require(:cohort).permit(
      :name,
      :year
    )
  end

  def load_cohort
    @cohort = Cohort.find(params[:id])
  end

  def prep_form
    @cohorts = Cohort.all
  end

  def sort_column
    Cohort.column_names.include?(params[:sort]) ? params[:sort] : "year"
  end


end
