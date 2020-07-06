class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favorites
  has_many :comments
  has_many :users, through: :comments 
  


end
