class User < ApplicationRecord
  has_secure_password

  has_many :clock_events
end
