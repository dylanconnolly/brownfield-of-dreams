class UserDashboardFacade
  def take_5_repos(token)
    UserGithubRepos.new.repos(token).take(5)
  end

  def all_followers(token)
    UserGithubFollowers.new.followers(token)
  end

  def all_followings(token)
    UserGithubFollowing.new.followings(token)
  end

  def friends(user)
    user.friendships.map do |friendship|
      User.find(friendship.friend_id)
    end
  end

  def bookmarked_videos(user_id)
    Video.bookmarked_videos(user_id)
  end
end
