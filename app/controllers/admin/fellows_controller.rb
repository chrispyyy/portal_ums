class Admin::FellowsController < ApplicationController

  class Admin::ProjectMembersController < Admin::BaseController

    before_filter :require_project
    before_filter :require_project_member, only: [:edit, :update, :show, :destroy]

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

    def require_project_member
      @project_member = @project.project_members.find(params[:id])
    end

  end

end
