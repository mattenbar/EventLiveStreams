class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  
  has_many :favorites

  validates :title, :time, :link, presence: true
  validates :genre_id, presence: true
  validates_associated :genre
  
  def genre_attributes=(attributes)
    genre = Genre.find_or_create_by(attributes)
    self.genre = genre if genre.valid? || !self.genre
 end

end
