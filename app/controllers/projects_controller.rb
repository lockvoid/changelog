class ProjectsController < ApplicationController
  before_action :set_projects, only: [:index, :new]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if @projects.empty?
      redirect_to new_project_url
    end
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_projects
      @projects = current_user.projects.order(:name)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
