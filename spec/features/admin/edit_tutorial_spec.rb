require 'rails_helper'

describe 'An Admin can edit a tutorial' do
  let(:tutorial) { create(:tutorial) }
  let(:admin)    { create(:admin) }

  scenario 'by adding a video', :js, :vcr do
    stub_user(admin)

    visit edit_admin_tutorial_path(tutorial)

    click_on 'Add Video'

    fill_in 'video[title]', with: 'How to tie your shoes.'
    fill_in 'video[description]', with: 'Over, under, around and through, Meet Mr. Bunny Rabbit, pull and through.'
    fill_in 'video[video_id]', with: 'J7ikFUlkP_k'
    click_on 'Create Video'

    expect(current_path).to eq(edit_admin_tutorial_path(tutorial))

    within(first('.video')) do
      expect(page).to have_content('How to tie your shoes.')
    end
  end

  scenario 'admin receives error message if video info is not completed', :js, :vcr do
    stub_user(admin)

    visit edit_admin_tutorial_path(tutorial)

    click_on 'Add Video'

    fill_in 'video[title]', with: 'How to tie your shoes.'
    fill_in 'video[description]', with: 'Over, under, around and through, Meet Mr. Bunny Rabbit, pull and through.'

    click_on 'Create Video'

    expect(page).to have_content('Unable to create video.')
  end

end
