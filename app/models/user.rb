class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :events, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :events_as_guest, through: :event_users, source: :event #all events (host + guests if we want to add host as event_user)
  has_many :messages, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true

  def friends
    User.where(id: self.friendships.pluck(:friend_id))
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def is_friend?(user)
    self.friends.include?(user)
  end

  def get_friendship(user)
    self.friendships.find_by(friend: user) || user.friendships.find_by(friend: self)
  end

end
