class User < ActiveRecord::Base
  has_secure_password
  has_many :links, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true
end
