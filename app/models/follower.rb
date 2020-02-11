class Follower
  attr_reader :github_handle, :html_url

  def initialize(follower_data)
    @github_handle = follower_data[:login]
    @html_url = follower_data[:html_url]
  end

  def is_user_in_database?
    User.find_by(github_handle: github_handle)
  end
end
