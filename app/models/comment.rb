class Comment
  include Mongoid::Document
  field :bubble_id, type: Integer
  field :body, type: String

  
  belongs_to :user
  belongs_to :bubble
end
