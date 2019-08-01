class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, uniqueness: {
    scope: :last_name,
    message: "should be unique with same last name"
  }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

  has_many :clock_events

  def full_name
    [first_name, last_name].join(' ')
  end

  def not_checkout_yet?
    clock_events.not_checkout_yet.exists?
  end
end
