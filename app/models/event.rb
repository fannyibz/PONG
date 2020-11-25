class Event < ApplicationRecord
  attr_accessor :friends

  belongs_to :user
  has_many :event_users, dependent: :destroy
  has_many :guests, through: :event_users, source: :user
  has_many :messages, dependent: :destroy
  # has_many_attached :photos à décommenter à la configu de Cloudinary
  
  validates :emoji, presence: true
  validates :address, presence: true
  validates :date_time, presence: true
  
  before_validation :set_attributes

  EMOJI = ['🍺', '🍷', '🍿', '🏀', '🍔', '🍣', '🏋️‍♂️', '🧘‍♀️', '🛍', '🍑', '🍌', '🎉', '⚽️', '🏃‍♂️',]

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  private

  def set_attributes
    self.emoji = "🍺" if self.emoji.blank?
    self.address = "10 rue du Chat-qui-Pêche, Paris" if self.address.blank?
    self.date_time = DateTime.now if self.date_time.blank?
  end
end
