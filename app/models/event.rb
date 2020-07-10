class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :artist
  
  has_many :favorites
  has_many :comments
  has_many :commenters, through: :comments, source: :commenter

 

  validates :title, :time, :link, presence: true
  validates :genre_id, presence: true
  validates_associated :genre
  validates_associated :artist
  
  def genre_attributes=(attributes)
    genre = Genre.find_or_create_by(attributes)
    self.genre = genre if genre.valid? || !self.genre
 end

 def artist_attributes=(attributes)
    artist = Artist.find_or_create_by(attributes)
    self.artist = artist if artist.valid? || !self.artist
  end



 scope :order_by_title, -> {order("lower(title) ASC")}

end
