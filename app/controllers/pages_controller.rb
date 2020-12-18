class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :components
  before_action :users, only: [:home, :users_list, :notifications_center]
  before_action :events_all, only: [:home, :users_list, :notifications_center]
  before_action :pending_friends, only: [:home, :notifications_center]
  before_action :pending_events, only: [:home, :notifications_center]
  before_action :notifications_counter, only: [:home, :notifications_center]
  
  
  def components
    authorize(:page, :components?)
  end

  def home
    if current_user
      @hosted_events = policy_scope(current_user.events)
      @invited_events = policy_scope(current_user.events_as_guest)
      @events = Event.joins(:event_users)
                     .where.not(address: nil)
                     .where(events: {user_id: current_user.id})
                     .or(Event.joins(:event_users)
                              .where(event_users: {user_id: current_user.id})
                              .where(event_users: {status: ["pending", "confirmed"]})
                     ).distinct
                      .where("date_time >= ?", DateTime.now.beginning_of_day)
                      .where("date_time <= ?", DateTime.now.end_of_day)

      # authorize @hosted_events if @hosted_events.empty?
      # authorize @invited_events if @invited_events.empty?

      # @hosted_events.each do |event|
      #   difference = -(event.date_time - DateTime.now)
      #   event.destroy if difference >= 36000 # au bout de 10h, l'event se supprime par défaut (36000 sec)
      # end

      # @invited_events.each do |event|
      #   difference = -(event.date_time - DateTime.now)
      #   event.destroy if difference >= 36000 # au bout de 10h, l'event se supprime par défaut (36000 sec)
      # end

      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @events.geocoded.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
          image_url: helpers.asset_url(Cloudinary::Utils.cloudinary_url(event.user.avatar.key, secure: true)),
          emoji: event.emoji,
          joined: event.user == current_user || event.event_users.confirmed.pluck(:user_id).include?(current_user.id),
          grey_marker: event.date_time >= DateTime.now + 2.hours
        }
      end
    else
      redirect_to new_user_session_path
    end
  end

  def dashboard
    authorize(:page, :dashboard?)
    @friendships = current_user.friendships.where(status:"approved").order(:created_at)
  end

  def users_list
    authorize(:page, :users_list?)
  end

  def notifications_center
    authorize(:page, :notifications_center?)
    @events = Event.all
  end

  private

  def users
    @users = User.all.select { |user| user != current_user }
  end

  def events_all
    if current_user
      @events_user = Event.joins(:event_users)
                              .where(event_users: {user_id: current_user.id})
                              .where(event_users: {status: ["pending", "confirmed"]})
    end
  end

  def pending_friends
    @friendships_users = @users.select do |user|
      if current_user
          current_user.get_friendship(user)&.status == 'pending' 
      end
    end
    @pending_friendships = @friendships_users.select do |user|
      current_user.get_friendship(user).friend == current_user
    end
  end
  
  def pending_events
    if current_user
      @pending_events = Event.joins(:event_users)
                              .where(event_users: {user_id: current_user.id})
                              .where(event_users: {status: ["pending"]})
    end
  end

  def notifications_counter
    if current_user
      @notifications_counter = @pending_friendships.count + @pending_events.count
      respond_to do |format|
        format.html
        format.json { render json: { notifications_counter: @notifications_counter } }
      end
    end
  end
end
