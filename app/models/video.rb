class Video < ApplicationRecord
  belongs_to :tutorial
  has_many :user_videos
  has_many :users, through: :user_videos

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :thumbnail
  validates_presence_of :position
end
