class UserFavoritesController < ApplicationController
  before_filter :require_login
  before_action :set_user

  def index
  end

  def create
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
