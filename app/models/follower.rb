class Follower
  attr_reader :github_handle, :html_url

  def initialize(follower_data)
    @github_handle = follower_data[:login]
    @html_url = follower_data[:html_url]
  end
end
