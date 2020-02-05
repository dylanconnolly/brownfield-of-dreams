require 'rails_helper'

describe "creating new tutorial" do
  it "admins are able to fill in tutorial details and create a new tutorial" do
    admin = create(:user, role: 1)

    stub_user(admin)

    visit "admin/tutorials/new"

    fill_in :tutorial_title, with: "Test Tutorial"
    fill_in :tutorial_description, with: "This is a test"
    fill_in :tutorial_thumbnail, with: "https://bit.ly/2GWWZwj"
    click_on "Save"

    new_tutorial = Tutorial.last

    expect(current_path).to eq("/tutorials/#{new_tutorial.id}")
    expect(page).to have_content("Successfully created tutorial.")
  end

  it "if form is not filled in completely, admin sees error flash and can fill form in again" do
    admin = create(:user, role: 1)

    stub_user(admin)

    visit "admin/tutorials/new"

    fill_in :tutorial_title, with: "Test Tutorial"
    fill_in :tutorial_description, with: ""
    fill_in :tutorial_thumbnail, with: "https://bit.ly/2GWWZwj"
    click_on "Save"

    expect(page).to have_content("Description can't be blank")

    fill_in :tutorial_description, with: "This is a test with a full description now"

    click_on "Save"

    new_tutorial = Tutorial.last

    expect(new_tutorial.title).to eq("Test Tutorial")
    expect(current_path).to eq("/tutorials/#{new_tutorial.id}")
    expect(page).to have_content("Successfully created tutorial.")
  end
end
