class Artist < ApplicationRecord
  has_many :events
  has_many :users, through: :events

  validates :name, presence: true
  validates :name, uniqueness: true


  scope :order_artists, -> {order(:name)}
  
end
