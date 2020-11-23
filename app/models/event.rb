class Event < ApplicationRecord
  has_many :event_users
  has_many :messages
end
