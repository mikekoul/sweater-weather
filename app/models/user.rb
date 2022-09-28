class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, email: true
  validates_presence_of :password_digest
  validates_presence_of :api_key
  has_secure_password
end