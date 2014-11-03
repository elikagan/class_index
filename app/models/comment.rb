class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActionView::Helpers::DateHelper
  field :bubble_id, type: Integer
  field :body, type: String

  
  belongs_to :user
  belongs_to :bubble
end
