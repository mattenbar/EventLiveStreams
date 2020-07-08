class Comment < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :event
  belongs_to :commenter, class_name: "User"

  


end
