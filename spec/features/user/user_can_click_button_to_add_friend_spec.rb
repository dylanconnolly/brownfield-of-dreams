require 'rails_helper'

RSpec.describe "user" do
  it "can click button to add a friend on dashboard page" do
    user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])
    follower = create(:user, github_handle: "follower_handle_1")
    following = create(:user, github_handle: "following_handle_1")

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

    within(first('.github-follower')) do
      expect(page).to have_content("follower_handle_1")
      click_button "Add as Friend"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Added friend!")
    expect(user.friendships.size).to eq(1)
  end
end
