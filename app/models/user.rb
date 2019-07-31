class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, uniqueness: {
    scope: :last_name,
    message: "should be unique with same last name"
  }
  validates :email, uniqueness: true

  has_many :clock_events
end
