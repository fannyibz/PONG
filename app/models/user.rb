class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
  has_many :messages, dependent: :destroy
  # has_one_attached :avatar => à décommenter quand cloudinary est configuré

  validates :first_name, presence: true
  validates :last_name, presence: true
end
