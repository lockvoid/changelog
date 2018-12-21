class Api::ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login

  def show
    @project = Project.find_by_api_key(params[:id]);

    render json: @project
  end
end