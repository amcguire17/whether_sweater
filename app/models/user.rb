class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :api_key, uniqueness: true, presence: true

  has_secure_password

  before_create :set_api_key

  def set_api_key
    SecureRandom.hex(20)
  end
end
