class UserGithubRepos
  def repos
    @repos ||= GithubService.new.user_repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end
