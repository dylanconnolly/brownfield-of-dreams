require 'rails_helper'

describe 'as a registered User' do
  it 'sees option to add github follower/following as friend' do
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

    within('#github-followers') do
      expect(page).to have_content("follower_handle_1")
      expect(page).to have_content("follower_handle_2")
    end

    within(first('.github-follower')) do
      expect(page).to have_content("follower_handle_1")
      expect(page).to have_button("Add as Friend")
    end

    within(all('.github-follower')[1]) do
      expect(page).to have_content("follower_handle_2")
      expect(page).to_not have_button("Add as Friend")
    end

    within('#github-followings') do
      expect(page).to have_content("following_handle_1")
      expect(page).to have_content("following_handle_2")
    end

    within(first('.github-following')) do
      expect(page).to have_content("following_handle_1")
      expect(page).to have_button("Add as Friend")
    end

    within(all('.github-following')[1]) do
      expect(page).to have_content("following_handle_2")
      expect(page).to_not have_button("Add as Friend")
    end
  end
end
