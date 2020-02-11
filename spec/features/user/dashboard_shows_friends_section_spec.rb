require 'rails_helper'

describe "user" do
  it "sees a friends section on the dashboard", :vcr do
    user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])
    friend_1 = create(:user, github_handle: "scottycoder")
    friend_2 = create(:user, github_handle: "dylancoding")

    stub_user(user)

    user.friendships.create(friend_id: friend_1.id)
    user.friendships.create(friend_id: friend_2.id)

    visit '/dashboard'

    within('#friendships') do
      expect(page).to have_css('.friend', count: 2)
      expect(page).to have_content(friend_1.github_handle)
      expect(page).to have_content(friend_2.github_handle)
    end
  end
end
