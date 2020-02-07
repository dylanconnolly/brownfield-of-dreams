class UserGithubRepos
  def repos
    return @repo_data if @repo_data
    service = GithubService.new
    @repo_data = service.get_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end
