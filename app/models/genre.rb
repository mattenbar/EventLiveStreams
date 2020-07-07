class Genre < ApplicationRecord
  has_many :events
  has_many :users, through: :events

  validates :name, presence: true
  validates_uniqueness_of :name
end
