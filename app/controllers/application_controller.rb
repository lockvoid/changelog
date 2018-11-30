class ApplicationController < ActionController::Base
  before_action :require_login

  def not_authenticated
    redirect_to signin_url, :alert => "First sign in to continue."
  end
end
