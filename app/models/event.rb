class Event < ApplicationRecord
  attr_accessor :friends, :current_latitude, :current_longitude

  belongs_to :user
  has_many :event_users, dependent: :destroy
  has_many :guests, through: :event_users, source: :user
  has_many :messages, dependent: :destroy
  # has_many_attached :photos à décommenter à la configu de Cloudinary


  # validates :emoji, presence: true
  # validates :address, presence: true
  validates :date_time, presence: true

  before_validation :set_attributes

  enum status: [:incompleted, :completed, :past]
  
  EMOJI = { anything: '🤷‍♂️', drink: '🍺', movies: '🍿', sip: '🍷', eat: '🍔', coffee: '☕️', sushis: '🍣', gym: '🏋️‍♂️', yoga: '🧘‍♀️', shop: '🛍', Rrrrr: ' 🍑', fruit: '🍌', dance: '💃', party: '🎉', basket: '🏀', surf: '🏄', run: '🏃‍♂️', football: '⚽️', code: '🤓', work: '👩‍💻', geek: '🎮', play: '🎰', bowling: '🎳', camp: '⛺️', fire: '🔥', catchup: '🥤', ski: '🎿' }

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def time_left
    seconds_diff = (Time.now - date_time).to_i.abs

    # Calculate the hours left
    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    # Calculate the minutes left
    minutes = seconds_diff / 60

    # Calculate the seconds left
    seconds = seconds_diff % 60

    # Return a nice string that display time left format: hh:mm
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

  private

  def set_attributes
    # self.emoji = "🍺" if self.emoji.blank?
    # self.address = "75017, Paris" if self.address.blank?
    self.description = "Shared his plan with you" if self.status.blank?
    self.date_time = DateTime.now if self.date_time.blank?
    self.status = "incompleted" if self.status.blank?
  end
end
