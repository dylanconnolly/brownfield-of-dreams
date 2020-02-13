class UserGithubRepos
  def repos(token)
    service = GithubService.new(token)
    @repos ||= service.user_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end
