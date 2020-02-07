class UserGithubFollowing
  def followings
    @followings ||= GithubService.new.user_followings.map do |follow_data|
      Following.new(follow_data)
    end
  end
end
