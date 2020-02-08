class UserGithubFollowing
  def followings(token)
    @followings ||= GithubService.new(token).user_followings.map do |follow_data|
      Following.new(follow_data)
    end
  end
end
