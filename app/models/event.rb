class Event < ApplicationRecord
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :messages, dependent: :destroy
  # has_many_attached :photos à décommenter à la configu de Cloudinary

  validates :emoji, presence: true
  validates :address, presence: true
  validates :date, :hour, presence: true
end
