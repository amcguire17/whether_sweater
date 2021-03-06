class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :api_key, uniqueness: true

  has_secure_password

  before_create do
    self.api_key = SecureRandom.hex(20)
  end
end
