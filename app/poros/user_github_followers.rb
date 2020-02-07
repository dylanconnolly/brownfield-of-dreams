class UserGithubFollowers
  def followers
    @followers ||= GithubService.new.user_followers.map do |follower_data|
      Follower.new(follower_data)
    end
  end
end
