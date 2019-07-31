class ClockEvent < ApplicationRecord
  validates :checkin_at, :user_id, presence: true
  validates :checkout_at_cannot_before_checkin_at

  belongs_to :user

  private
  def checkout_at_cannot_before_checkin_at
    if checkout_at.present? && checkout_at <= checkin_at
      errors.add(:checkout_at, "cannot be before checkin time")
    end
  end
end
