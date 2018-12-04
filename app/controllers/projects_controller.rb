class ProjectsController < ApplicationController
  before_action :set_projects, only: [:index, :new, :create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    if @projects.empty?
      redirect_to new_project_url
    end
  end

  def show
    @releases = @project.releases.order(date: :desc)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      ActiveRecord::Base.transaction do
        if @project.save
          @project.releases.create name: 'v1.0.0', date: Time.now, body: Release::BODY_TEMPLATE

          format.html { redirect_to @project }
        else
          format.html { render :new }
        end
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
