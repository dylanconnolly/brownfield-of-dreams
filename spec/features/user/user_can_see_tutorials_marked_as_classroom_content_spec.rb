require 'rails_helper'

describe 'a user' do
  it 'can see videos marked as classroom content on homepage' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    classroom_tutorial = create(:tutorial, title: 'This Video is for Logged In Users Only', classroom: true)
    tutorial = create(:tutorial, title: 'This tutorial can be viewed by Visitors')

    visit '/'

    expect(page).to have_css('.tutorial', count: 2)

    expect(page).to have_content(classroom_tutorial.title)
    expect(page).to have_content(classroom_tutorial.description)

    expect(page).to have_content(tutorial.title)
    expect(page).to have_content(tutorial.description)
  end
end
