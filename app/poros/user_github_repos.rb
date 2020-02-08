class UserGithubRepos
  def repos(token)
    @repos ||= GithubService.new(token).user_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end
