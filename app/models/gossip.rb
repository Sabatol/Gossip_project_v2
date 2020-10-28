class Gossip < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  
  belongs_to :user
  has_many :tags, through: :go_tags
  has_many :comments
end
