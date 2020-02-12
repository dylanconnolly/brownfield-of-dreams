require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'relationships' do
    it { should have_many(:videos) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:thumbnail) }
  end

  describe "class methods" do
    it '.no_classroom' do

      create_list(:tutorial, 3,title: 'This Video is for Logged In Users Only', classroom: true)
      non_classroom_tutorials = create_list(:tutorial, 3, title: 'This tutorial can be viewed by Visitors')

      expect(Tutorial.no_classroom.count).to eq(3)

      Tutorial.no_classroom.each do |tutorial|
        expect(tutorial.classroom).to eq(false)
      end
    end
  end

  describe "video_relationship" do
    it "when a tutorial is deleted from database, its videos are deleted as well" do

      tutorial = create(:tutorial)
      tutorial_2 = create(:tutorial)

      create_list(:video, 3, tutorial: tutorial)
      create_list(:video, 4, tutorial: tutorial_2)

      expect(Video.count).to eq(7)
      expect(tutorial.videos.count).to eq(3)

      Tutorial.destroy(tutorial.id)

      expect(Video.count).to eq(4)
      expect(tutorial_2.videos.count).to eq(4)

      expect(Tutorial.count).to eq(1)
    end
  end
end
