class UserGithubFollowers
  def followers(token)
    @followers ||= GithubService.new(token).user_followers.map do |follower_data|
      Follower.new(follower_data)
    end
  end
end
