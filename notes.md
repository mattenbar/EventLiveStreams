Live Streams

User Model
  has many events
  has many comments
  has many commented_events through comments
  has_many :favorited_events, through: :favorites, foreign_key: "event_id"
  has_secure_password
  first name
  last name
  username
  email
  password_digest

Event Model
  belongs to user
  belongs to genre
  has many favorites
  
  title
  description
  link
  time

Genre Model
  belongs to event
  has_many events
  has many users through events
  name

Favorites Model
  belongs to user
  belongs to event

