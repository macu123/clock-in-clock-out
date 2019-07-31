class ClockEvent < ApplicationRecord
  validates :checkin_at, :user_id, presence: true
  validates :checkout_at_cannot_before_checkin_at

  belongs_to :user

  scope :not_checkout_yet, -> { where('CHECKIN_AT IS NOT NULL AND CHECKOUT_AT IS NULL') }

  private
  def checkout_at_cannot_before_checkin_at
    if checkout_at.present? && checkout_at <= checkin_at
      errors.add(:checkout_at, "cannot be before checkin time")
    end
  end
end
