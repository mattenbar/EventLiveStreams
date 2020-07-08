class User < ApplicationRecord
  has_many :events

  has_many :favorites 
  has_many :favorited_events, through: :favorites, source: :event

  has_many :comments
  has_many :commented_events, through: :comments, source: :event

  validates :user_name, :email, uniqueness: true
  validates :user_name, :email, presence: true


  has_secure_password

  scope :user_events, -> {where(user_id: current_user.id)}
end
