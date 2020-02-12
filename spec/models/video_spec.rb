require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'relationships' do
    it { should belong_to(:tutorial) }
    it { should have_many(:user_videos) }
    it { should have_many(:users).through(:user_videos) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:thumbnail) }
    it { should validate_presence_of(:position) }
  end

  describe "queries" do
    it "bookmarked_videos" do
      user = create(:user)
      user_2 = create(:user)

      prework_tutorial = create(:tutorial)
        prework_video_1 = create(:video, position: 1, tutorial: prework_tutorial)
        prework_video_2 = create(:video, position: 2, tutorial: prework_tutorial)
        prework_video_3 = create(:video, position: 3, tutorial: prework_tutorial)

      mod_1_tutorial = create(:tutorial)
        m1_video_1 = create(:video, position: 1, tutorial: mod_1_tutorial)
        m1_video_3 = create(:video, position: 3, tutorial: mod_1_tutorial)

      user.videos << prework_video_3
      user.videos << prework_video_1
      user.videos << m1_video_1
      user.videos << m1_video_3

      user_2.videos << prework_video_2
      user_2.videos << prework_video_1
      user_2.videos << prework_video_3

      expect(Video.bookmarked_videos(user.id).length).to eq(4)
      expect(Video.bookmarked_videos(user.id).first.id).to eq(prework_video_1.id)
      expect(Video.bookmarked_videos(user.id)[1].id).to eq(prework_video_3.id)
      expect(Video.bookmarked_videos(user.id)[2].id).to eq(m1_video_1.id)

      expect(Video.bookmarked_videos(user_2.id).length).to eq(3)
      expect(Video.bookmarked_videos(user_2.id).first.id).to eq(prework_video_1.id)
      expect(Video.bookmarked_videos(user_2.id).last.id).to eq(prework_video_3.id)
    end
  end
end
