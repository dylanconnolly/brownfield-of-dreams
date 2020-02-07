class UserDashboardFacade
  def take_5_repos
    UserGithubRepos.new.repos.take(5)
  end

  def all_followers
    UserGithubFollowers.new.followers
  end

  def all_followings
    UserGithubFollowing.new.followings
  end
end
