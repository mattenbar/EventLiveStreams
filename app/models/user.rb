class User < ApplicationRecord
  has_many :events

  has_many :favorites 
  has_many :favorited_events, through: :favorites, source: :event

  has_secure_password
end
