class RegistrationsController < ApplicationController
  before_filter :require_not_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)

    if @user.save
      auto_login @user
      redirect_to tweets_url, notice: "welcome! #{@user.name}!"
    else
      render "new"
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
