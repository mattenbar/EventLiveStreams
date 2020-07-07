class User < ApplicationRecord
  has_many :events

  has_many :favorites 
  has_many :favorited_events, through: :favorites, source: :event

  validates :user_name, :email, uniqueness: true
  validates :user_name, :email, presence: true


  has_secure_password
end
