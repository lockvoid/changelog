class SessionsController < ApplicationController
  skip_before_action :require_login

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_back_or_to root_url
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout

    redirect_to root_url
  end
end
