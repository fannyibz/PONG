class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  enum status: [:pending, :confirmed, :declined]
  enum role: [:partner, :visitor] # :host -> host added if role :host added

  before_create :set_role, :set_status

  private

  def set_role
    self.role = "visitor" if self.role.nil?
  end

  def set_status
    self.status = "pending" if self.status.nil?
  end
end
