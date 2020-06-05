class User < ActiveRecord::Base
  has_secure_password
  has_many :days
  has_many :foods

  validates :email, presence: true, :uniqueness => true
  validates :password_digest, presence: true
end
