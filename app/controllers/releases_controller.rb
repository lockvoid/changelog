class ReleasesController < ApplicationController
  before_action :set_release, only: [:edit, :update, :destroy]

  def new
    @project = Project.find params[:project_id]
    @release = @project.releases.build name: 'v1.0.0', date: Time.now, body: Release::BODY_TEMPLATE

    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    @project = Project.find params[:project_id]
    @release = @project.releases.build release_params

    respond_to do |format|
      if @release.save
        format.js
      else
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @release.update(release_params)
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @release.destroy

    respond_to do |format|
      format.js
    end
  end

 private

  def set_release
    @release = Release.find(params[:id])
  end

  def release_params
    params.require(:release).permit(:name, :date, :body)
  end
end
