class ClockEvent < ApplicationRecord
  validates :checkin_at, :user_id, presence: true
  validate :checkin_at_cannot_in_the_future
  validate :checkout_at_cannot_in_the_future
  validate :checkout_at_cannot_before_checkin_at

  belongs_to :user

  scope :not_checkout_yet, -> { where('CHECKIN_AT IS NOT NULL AND CHECKOUT_AT IS NULL') }

  private
  def checkin_at_cannot_in_the_future
    if checkin_at.present? && checkin_at > Time.now
      errors.add(:checkin_at, "cannot be in the future")
    end
  end

  def checkout_at_cannot_in_the_future
    if checkout_at.present? && checkout_at > Time.now
      errors.add(:checkout_at, "cannnot be in the future")
    end
  end

  def checkout_at_cannot_before_checkin_at
    if checkout_at.present? && checkout_at <= checkin_at
      errors.add(:checkout_at, "cannot be before checkin time")
    end
  end
end
