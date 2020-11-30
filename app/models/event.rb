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

  enum status: [:incompleted, :completed, :pasted]

  EMOJI = { beer: '🍺', sipping: '🍷', movies: '🍿', basket: '🏀', fastfood: '🍔', sushis: '🍣', gym: '🏋️‍♂️', yoga: '🧘‍♀️', shopping: '🛍',Rrrrrr: ' 🍑', banana: '🍌', party: '🎉', football: '⚽️', jogging: '🏃‍♂️', codding: '🤓', geeking: '🎮', ski: '🎿', netflix: '🎬' }

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def time_left
    seconds_diff = (Time.now - date_time).to_i.abs
    # Calculate the hours lefts
    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    # Calculate the minutes lefts
    minutes = seconds_diff / 60

    # Return a nice string that display time left format: hh:mm
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
  end

  private

  def set_attributes
    self.emoji = "🍺" if self.emoji.blank?
    self.address = "75017, Paris" if self.address.blank?
    self.description = "Click here to add more infos to your event" if self.status.blank?
    self.date_time = DateTime.now if self.date_time.blank?
    self.status = "incompleted" if self.status.blank?
  end
end
