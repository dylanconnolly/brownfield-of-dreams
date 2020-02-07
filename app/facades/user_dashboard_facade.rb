class UserDashboardFacade
  def take_5_repos
    UserGithubRepos.new.repos.take(5)
  end
end
