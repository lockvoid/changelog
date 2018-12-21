class AssetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login

  def show
    respond_to do |format|
      format.js { redirect_to ActionController::Base.helpers.asset_pack_path("#{params[:id]}.js") }
    end
  end
end
