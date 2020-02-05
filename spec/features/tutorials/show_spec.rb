require 'rails_helper'

describe "tutorial show page" do
  it "does not throw error if there are no videos attached to tutorial" do
    tutorial = create(:tutorial)

    visit "/tutorials/#{tutorial.id}"

    expect(page).to have_content("There are no videos.")

  end
end
