require 'rails_helper'

RSpec.describe Tutorial, type: :model do
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

end
