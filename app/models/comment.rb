class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActionView::Helpers::DateHelper
  field :bubble_id, type: Integer
  field :body, type: String
  field :vote_count, type: Integer, default: 0
  field :score, type: Integer, default: 0

  
  belongs_to :user
  belongs_to :bubble


  def comment_score
  	score = self.vote_count
  	self.update_attribute(:score, score)
  end
end
