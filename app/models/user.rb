class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :age, presence: true

  belongs_to :city
  has_many :gossips
  has_many :send_messages, class_name: "PrivateMessage"
  has_many :received_messages, class_name: "PrivateMessage", through: :pm_users
end
