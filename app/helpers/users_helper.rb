module UsersHelper
  def render_user_screen_name user
    if user.screen_name.nil? or user.screen_name.empty?
      user.name
    else
      user.screen_name
    end
  end

  def link_to_follow_or_unfollow user
    unless user == current_user
      if user.followed_by? current_user
        link_to "フォロー解除", user_follows_path(user), method: :delete
      else
        link_to "フォローする", user_follows_path(user), method: :post
      end
    end
  end
end
