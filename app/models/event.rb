class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users, dependent: :destroy
  has_many :guests, through: :event_users, source: :user
  has_many :messages, dependent: :destroy
  # has_many_attached :photos à décommenter à la configu de Cloudinary

  validates :emoji, presence: true
  validates :address, presence: true
  validates :date_time, presence: true
end
