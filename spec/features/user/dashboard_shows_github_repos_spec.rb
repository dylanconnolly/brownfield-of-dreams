require 'rails_helper'

describe 'when a user visits their dashboard' do
  scenario 'they see a section for github repositories and see 5 listed', :vcr do
    user = create(:user)

    stub_user(user)

    visit '/dashboard'

    expect(page).to have_css('#github-repos')

    within('#github-repos') do
      expect(page).to have_css('.github-repo', count: 5)
    end
  end

  scenario 'they see their github repositories and not another users', :vcr do
    user = create(:user)
    user2 = create(:user)
    # user2 = create(:user, github_token: ENV['SECONDARY_GITHUB_PERSONAL_TOKEN'])

    stub_user(user2)

    visit '/dashboard'

    expect(page).to have_css('#github-repos')

    within('#github-repos') do
      expect(page).to have_css('.github-repo', count: 5)
    end
  end
end
