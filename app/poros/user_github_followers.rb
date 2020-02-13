class UserGithubFollowers
  def followers(token)
    service = GithubService.new(token)
    @followers ||= service.user_followers.map do |follower_data|
      Follower.new(follower_data)
    end
  end
end
