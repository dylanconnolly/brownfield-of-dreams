require 'rails_helper'

describe "as a user" do
  it "can send an invite to a github user from the dashboard if github user has an email address listed on their github account", :vcr do
    user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])

    stub_user(user)

    visit '/dashboard'

    click_on "Send an Invite"

    expect(current_path).to eq('/invite')

    fill_in :github_handle, with: "octocat"

    click_on "Send Invite"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Successfully sent invite!')
  end

  it "sees an error message if github account does not have an email address listed", :vcr do
    user = create(:user)

    stub_user(user)

    visit '/dashboard'

    click_on "Send an Invite"

    expect(current_path).to eq('/invite')

    fill_in :github_handle, with: "dylanconnolly"

    click_on "Send Invite"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("The Github user you selected doesn't have an email address associated with their account.")
  end
end
