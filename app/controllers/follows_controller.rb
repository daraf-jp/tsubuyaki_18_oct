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

  def destroy
    @follow = Follow.find_by!(follower_id: current_user.id, inverse_follower_id: params[:user_id])

    if @follow.inverse_follower == current_user
      redirect_to tweets_url, notice: "can't unfollow yourself."
    else
      @follow.destroy
      redirect_to tweets_url, notice: "successfully unfollowed."
    end
  end
end
