class RegistrationsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login user

      redirect_to new_project_url
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :display_name)
  end
end
