class Video < ApplicationRecord
  belongs_to :tutorial
  has_many :user_videos
  has_many :users, through: :user_videos

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :thumbnail
  validates_presence_of :position

  def self.bookmarked_videos(user_id)
    joins(:tutorial, :users).
    select('videos.*, users.id AS user_id').
    where("user_id = #{user_id}").
    order('tutorial_id, position')
  end
end

Video.joins(:tutorial, :users).
select('videos.*, users.id AS user_id').
where('user_id = 14').
order('tutorial_id, position')
