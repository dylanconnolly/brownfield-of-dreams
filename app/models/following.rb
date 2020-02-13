class Following
  attr_reader :github_handle, :html_url

  def initialize(following_data)
    @github_handle = following_data[:login]
    @html_url = following_data[:html_url]
    @friend = nil
  end

  def user_in_database?
    User.find_by(github_handle: github_handle)
  end

  def already_friend(user)
    Friendship.find_by(user_id: user, friend_id: user_in_database?.id)
  end
end
