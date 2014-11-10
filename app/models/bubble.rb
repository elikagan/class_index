class Bubble
  include Mongoid::Document
  include Mongoid::Timestamps
	include ActionView::Helpers::DateHelper
  field :title, type: String
  field :body, type: String
  field :tag, type: String
  field :vote_count, type: Integer, default: 0
  field :score, type: Integer, default: 0
  field :time_bonus_value, type: Integer, default: 0


  belongs_to :user
  has_many :comments

  validates :title, presence: :true
  validates :body, presence: :true
  validates :tag, presence: :true

  def time_bonus
    
    if Time.now.to_i - self.created_at.to_i < 3600
      time_bonus_value = 200
    elsif Time.now.to_i - self.created_at.to_i < 86400
      time_bonus_value = 50
    elsif Time.now.to_i - self.created_at.to_i < 604800
      time_bonus_value = 20
    else
      time_bonus_value = 0
    end
    self.update_attribute(:time_bonus_value, time_bonus_value)
  end

  def bubble_score
  	score = self.comments.count * 7 + self.vote_count * 5 + self.time_bonus_value
  	self.update_attribute(:score, score)
  end



end
