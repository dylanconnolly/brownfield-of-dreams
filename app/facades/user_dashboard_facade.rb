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
end
