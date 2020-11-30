class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, uniqueness: {scope: :event}

  scope :order_by_status, -> { order(status: :desc) }
  enum status: [:declined, :pending, :confirmed]
  enum role: [:partner, :visitor] # :host -> host added if role :host added

  before_create :set_role, :set_status

  EMOJI_STATUS = {
    "pending": '🤷‍♂️',
    "confirmed": '✅',
    "declined": '❌'
  }

  private

  def set_role
    self.role = "visitor" if self.role.nil?
  end

  def set_status
    self.status = "pending" if self.status.nil?
  end
end
