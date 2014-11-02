class Bubble
  include Mongoid::Document
  field :title, type: String
  field :body, type: String

  belongs_to :user
  has_many :comments

end
