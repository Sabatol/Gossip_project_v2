class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  belongs_to :user
  has_many :tags, through: :go_tags
  has_many :comments
  has_many :likes
end
