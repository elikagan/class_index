class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_many :bubbles
  has_many :comments


end
