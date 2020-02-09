require 'rails_helper'

describe 'An admin user can add tags to tutorials' do
  it 'clicks on the add tag on a tutoral' do
    admin = create(:user, role: 1)
    tutorial = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial.id)

    stub_user(admin)

    visit '/admin/dashboard'

    within(first('.admin-tutorial-card')) do
      click_on 'Edit'
    end

    expect(current_path).to eq(edit_admin_tutorial_path(tutorial))

    fill_in 'tutorial[tag_list]', with: 'Ruby'
    click_on 'Update Tags'
    visit root_path

    within('.categories') do
      expect(page).to have_content('Ruby')
    end

    within('.categories') do
      click_on 'Ruby'
    end

    expect(current_path).to eq('/tags/Ruby')
  end
end
