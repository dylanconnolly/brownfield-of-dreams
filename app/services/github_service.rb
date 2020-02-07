class GithubService
  def user_repos
    get_json('/user/repos')
  end

  def user_followers
    get_json('/user/followers')
  end

  def user_followings
    get_json('/user/following')
  end

  private

  def connection
    Faraday.new('https://api.github.com') do |f|
      f.headers['Authorization'] = "token #{ENV['GITHUB_PERSONAL_TOKEN']}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(uri)
    response = connection.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end
end
