class UserGithubFollowing
  def followings(token)
    service = GithubService.new(token)
    @followings ||= service.user_followings.map do |following_data|
      Following.new(following_data)
    end
  end
end
