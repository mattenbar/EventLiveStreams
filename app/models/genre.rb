class Genre < ApplicationRecord
  has_many :events
  has_many :users, through: :events

  validates :name, presence: true
  validates :name, uniqueness: true


  scope :order_genres, -> {order(:name)}
  
end
