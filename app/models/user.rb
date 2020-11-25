class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :events_as_guest, through: :event_users, source: :event
  has_many :messages, dependent: :destroy
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
end
