class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password_digest, type: String

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password
end
