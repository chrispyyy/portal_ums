class FellowsController < ApplicationController

class Admin::CohortsController < Admin::BaseController
  
  include SortedColumns

  before_filter :load_cohort, only: [:show, :edit, :update, :destroy]
  before_filter :prep_form, only: [:new, :edit]

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to admin_cohorts_path, notice: "#{@cohort.course_name} was successfully created"
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
    @cohorts = @cohorts.part_time if params[:type] == 'Part-Time'
    @cohorts = @cohorts.full_time if params[:type] == 'Full-Time'

    @cohorts = @cohorts.city(params[:city]) if params[:city].present?
    @cohorts = @cohorts.program(params[:program]) if params[:program].present?
    @cohorts = @cohorts.by_keywords(params[:search]) if params[:search].present?

    case params[:status]
    when 'Current'
      @cohorts = @cohorts.current
    when 'Upcoming'
      @cohorts = @cohorts.upcoming
    when 'Past'
      @cohorts = @cohorts.past
    end

    @cohorts = @cohorts.page(params[:page]).per(20)
  end

  def destroy
    if @cohort.destroy
      redirect_to admin_cohorts_path, notice: "#{@cohort.course_name} was deleted"
    else
      redirect_to admin_cohorts_path, alert: "#{@cohort.course_name} can't be deleted because there are applications"
    end
  end

  protected 

  def cohort_params
    params.require(:cohort).permit(
      :course_name, 
      :starts_on, 
      :ends_on, 
      :short_name, 
      :available, 
      :program_id, 
      :value, 
      :deposit_amount, 
      :wait_list, 
      :part_time_days => []
    )
  end

  def load_cohort
    @cohort = Cohort.find(params[:id])
  end

  def prep_form
    @programs = Program.all
  end

  def sort_column
    Table.column_names.include?(params[:sort]) ? params[:sort] : "ends_on" 
  end


end
