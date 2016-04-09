class Admin::FellowsController < ApplicationController

  include SortedColumns

  before_action :require_fellow, only: [:edit, :update, :show, :destroy]

  def index
    @fellow = Fellow

    if params[:cohort_id].present?
      if params[:cohort_id] == '0'
        @fellow = @fellow.for_cohort(nil)
      elsif cohort = Cohort.find_by(id: params[:cohort_id])
        @fellow = @fellow.for_cohort(cohort)
      end

  @cohorts = {
    "Not Sure" => [nil],
    "Upcoming" => Cohort.for_public,
    "Completed" => Cohort.completed
  }

  # Need to have unscoped archived check as first one due to default_scope requiring an unscoped called - KV
  @student_applications = @student_applications.unscoped.archived if params[:archived]
  @student_applications = @student_applications.completed if params[:completed]
  @student_applications = @student_applications.order(sort_column + " " + sort_direction)

  if params[:cohort_id].present?
    if params[:cohort_id] == '0'
      @student_applications = @student_applications.for_cohort(nil)
    elsif cohort = Cohort.find_by(id: params[:cohort_id])
      @student_applications = @student_applications.for_cohort(cohort)
    end
  end

  def new
    @project_member = @project.project_members.new
  end

  def create
    @project_member = @project.project_members.new(project_member_params)
    if @project_member.save
      redirect_to admin_project_path(@project), notice: "Member #{@project_member.name} was created"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @project_member.update_attributes(project_member_params)
      redirect_to admin_project_path(@project), notice: "Member #{@project_member.name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @project_member.destroy
      redirect_to admin_project_path(@project), notice: "Member #{@project_member.name} was deleted"
    else
      render :show
    end
  end

  private

  def project_member_params
    params.require(:project_member).permit(
      :name,
      :github,
      :linkedin,
      :image
    )
  end

  def require_project
    @project = Project.find params[:project_id]
  end

  def require_fellow
    @fellow = @cohort.fellows.find(params[:id])
  end

end
