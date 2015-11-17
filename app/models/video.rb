class Video < ActiveRecord::Base
  belongs_to :user
  has_many :videos_categories
  has_many :categories, through: :videos_categories
  has_many :comments
  has_many :favorites
  has_many :favoriting_users, through: :favorites, source: :user

  acts_as_taggable

  # paperclip
  has_attached_file :videofile
  validates_attachment :videofile, content_type: { content_type: ["movie/mp4", "video/mp4", "application/ppt"] }

  validates :user_id,             presence: true,
                                  numericality: { only_integer: true }
  validates :title,               presence: true,
                                  length: { maximum: 255 }
end
