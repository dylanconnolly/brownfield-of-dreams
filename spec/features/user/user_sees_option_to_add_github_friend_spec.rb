require 'rails_helper'

describe 'as a registered User' do
  it 'sees option to add github follower/following as friend' do
    user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])

    stub_user(user)

    json_follower_response = File.read('spec/fixtures/github_followers.json')
    stub_request(:get, "https://api.github.com/user/followers").
    to_return(status: 200, body: json_follower_response)

    json_following_response = File.read('spec/fixtures/github_following.json')
    stub_request(:get, "https://api.github.com/user/following").
    to_return(status: 200, body: json_following_response)

    json_repo_response = File.read('spec/fixtures/github_repos.json')
    stub_request(:get, "https://api.github.com/user/repos").
    to_return(status: 200, body: json_repo_response)

    visit dashboard_path


      require "pry"; binding.pry

  end
end
