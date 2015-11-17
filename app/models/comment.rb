class Comment < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  validates :description,         length: { maximum: 2000 }
  validates :user_id,             presence: true
#                                  numericality: { only_integer: true }
  validates :video_id,            presence: true
#                                  numericality: { only_integer: true }
end