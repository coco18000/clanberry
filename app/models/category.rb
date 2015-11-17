class Category < ActiveRecord::Base
  has_many :videos_categories
  has_many :videos, through: :videos_categories

  validates :video_id,             presence: true,
                                   numericality: { only_integer: true }
  validates :code,                 presence: true,
                                   numericality: { only_integer: true }
end