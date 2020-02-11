class Following
  attr_reader :github_handle, :html_url

  def initialize(following_data)
    @github_handle = following_data[:login]
    @html_url = following_data[:html_url]
  end
end
