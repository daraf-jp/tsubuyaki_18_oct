class FavoritesController < ApplicationController
  before_filter :require_login

  def create
    @tweet    = Tweet.find(params[:tweet_id])
    @favorite = current_user.favorites.build(tweet: @tweet)

    if @favorite.save
      redirect_to tweets_url, notice: "succesfully favorited."
    else
      redirect_to tweets_url, notice: "failed"
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
    @favorite.destroy
    redirect_to tweets_url, notice: "succesfully deleted favorite."
  end
end
