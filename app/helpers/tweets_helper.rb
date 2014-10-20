module TweetsHelper
  def link_to_favorite_or_unfavorite tweet
    if tweet.favorited_by? current_user
      link_to "お気に入りを解除", tweet_favorites_path(tweet), method: :delete
    else
      link_to "お気に入りに追加", tweet_favorites_path(tweet), method: :post
    end
  end
end
