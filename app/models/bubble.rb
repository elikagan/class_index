class Bubble
  include Mongoid::Document
  include Mongoid::Timestamps
	include ActionView::Helpers::DateHelper
  field :title, type: String
  field :body, type: String
  field :tag, type: String
  field :score, type: Integer, default: 0

  belongs_to :user
  has_many :comments

  def bubble_score
  	score = self.comments.count * 10
  	self.update_attribute(:score, score)
  end


end
