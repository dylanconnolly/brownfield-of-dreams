require 'rails_helper'

describe 'visitor visits video show page' do
  it 'clicks on the bookmark page and is sent to the log in page' do

    tutorial = create(:tutorial, title: 'How to Tie Your Shoes')
    video = create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial)

    visit tutorial_path(tutorial)

    click_on "Bookmark"

    expect(page).to have_content('You must log in to bookmark videos')

    expect(UserVideo.count).to eq(0)

    expect(current_path).to eq(tutorial_path(tutorial))
  end

end
