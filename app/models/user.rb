class User < ApplicationRecord
  has_many :events

  has_many :favorites 
  has_many :favorited_events, through: :favorites, source: :event

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true

  has_secure_password
end
