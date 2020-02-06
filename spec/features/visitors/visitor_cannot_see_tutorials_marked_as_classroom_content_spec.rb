require 'rails_helper'

describe 'a visitor' do
  it 'cannot see videos that are marked as classroom' do
    classroom_tutorial = create(:tutorial, title: 'This Video is for Logged In Users Only', description: "This video should not be seen by visitors", classroom: true)
    tutorial = create(:tutorial, title: 'This tutorial can be viewed by Visitors')

    visit '/'

    expect(page).to have_css('.tutorial', count: 1)

    expect(page).to_not have_content(classroom_tutorial.title)
    expect(page).to_not have_content(classroom_tutorial.description)

    expect(page).to have_content(tutorial.title)
    expect(page).to have_content(tutorial.description)
  end
end
