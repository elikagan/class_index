class Bubble
  include Mongoid::Document
  include Mongoid::Timestamps
	include ActionView::Helpers::DateHelper
  field :title, type: String
  field :body, type: String
  field :tag, type: String

  belongs_to :user
  has_many :comments

end
