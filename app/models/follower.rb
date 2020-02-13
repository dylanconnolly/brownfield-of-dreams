class Follower
  attr_reader :github_handle, :html_url

  def initialize(follower_data)
    @github_handle = follower_data[:login]
    @html_url = follower_data[:html_url]
  end

  def user_in_database?
    User.find_by(github_handle: github_handle)
  end

  def already_friend(user)
    Friendship.find_by(user_id: user, friend_id: user_in_database?.id)
  end
end
