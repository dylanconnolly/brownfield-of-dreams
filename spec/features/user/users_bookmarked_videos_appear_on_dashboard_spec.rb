require 'rails_helper'

describe "when a user visits their dashboard" do
  it "they see a section with their bookmarked videos", :vcr do

    tutorial = create(:tutorial, title: 'How to Tie Your Shoes')
    video = create(:video, title: 'The Bunny Ears Technique', tutorial: tutorial, position: 1)
    video_2 = create(:video, title: 'Principals of OOP', tutorial: tutorial, position: 2)

    user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])

    stub_user(user)

    visit tutorial_path(tutorial)

    expect { click_on 'Bookmark' }.to change { UserVideo.count }.by(1)

    expect(page).to have_content('Bookmark added to your dashboard')

    visit '/dashboard'

    expect(page).to have_css('#bookmarks')

    within('#bookmarks') do
      expect(page).to have_css('.bookmarked-video', count: 1)
      expect(page).to have_content(video.title)
    end

    visit "/tutorials/#{tutorial.id}?video_id=#{video_2.id}"

    expect { click_on 'Bookmark' }.to change { UserVideo.count }.by(1)

    expect(page).to have_content('Bookmark added to your dashboard')

    visit '/dashboard'

    within('#bookmarks') do
      expect(page).to have_css('.bookmarked-video', count: 2)
      expect(page).to have_content(video.title)
      expect(page).to have_content(video_2.title)
    end
  end
end
