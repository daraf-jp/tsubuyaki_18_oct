class FollowsController < ApplicationController
  before_filter :require_login

  def create
    @user = User.find(params[:user_id])
    @follow = @user.follows.build(follower: current_user)

    if @follow.save
      redirect_to tweets_url, notice: "successfully followed."
    else
      redirect_to tweets_url
    end
  end
end
