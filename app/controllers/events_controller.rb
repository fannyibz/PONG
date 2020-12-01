class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit_what, :update_what, :edit_address, :update_address, :edit_when, :update_when, :edit_friends, :update_friends, :destroy, :edit, :update, :chatroom]
  before_action :current_guest, only: [:edit_friends, :show]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @hosted_events = policy_scope(current_user.events)
    @invited_events = policy_scope(current_user.events_as_guest)
    @events = Event.joins(:event_users)
                   .where(events: {user_id: current_user.id})
                   .or(Event.joins(:event_users)
                            .where(event_users: {user_id: current_user.id})
                   ).order(:date_time)
    @past_events = @events.where("date_time < ?", DateTime.now.beginning_of_day)
    @ongoing_events = @events.where("date_time >= ?", DateTime.now.beginning_of_day)
                             .where("date_time < ?", DateTime.now)
    @upcoming_events = @events.where("date_time >= ?", DateTime.now.beginning_of_day)
                             .where("date_time >= ?", DateTime.now)
    # @today_events = policy_scope()
  end

  def show
    @user_is_host = @event.user == current_user
  end

  #METHODS USED FOR THE SIMPLE_FORM:
  def edit
  end

  def update
    redirect_to event_path(@event) if @event.update(event_params)
  end

  def create
    @event = Event.new
    authorize @event
    @event.user = current_user
    @event.save
    #EventUser.create!(event: @event, user: current_user, status: "confirmed", role: "host") #If we want to add the host as the first event_uset
    redirect_to edit_what_event_path(@event)
  end

  def edit_what
  end

  def update_what
    if @event.update(event_params)
      redirect_to edit_address_event_path(@event)
    else
      render :edit_what
    end
  end

  def edit_address

  end

  def update_address
    if @event.update(event_params)
      redirect_to edit_when_event_path(@event)
    else
      render :edit_address
    end
  end

  def edit_when
  end

  def update_when
    if @event.update(event_params)
      redirect_to edit_friends_event_path(@event)
    else
      render :edit_when
    end
  end

  def edit_friends
    # @friends = current_user.friendships.where(status: "approved")
    @friends = current_user.friendships.where(status: "approved").map { |friendship| User.find(friendship.friend_id) }
  end

  def update_friends
    @event.event_users.destroy_all
    params[:event][:friends].each do |user_id|
      EventUser.create(event: @event, user_id: user_id)
    end
    @event.update(open: params.dig(:event, :open) == '1' ? true : false)
    @event.completed!
    redirect_to root_path
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to root_path
  end

  def chatroom
    @message = Message.new
  end

  private

  def find_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    strong_params = params.require(:event).permit(:emoji, :address, :date_time, :status)
    strong_params[:emoji] = Event::EMOJI[strong_params[:emoji].to_sym] if strong_params[:emoji]
    strong_params
  end

  def current_guest
    @current_guest = @event.event_users.find_by(user: current_user)
  end
end
