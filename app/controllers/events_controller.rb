class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit_what, :update_what, :edit_address, :update_address, :edit_when, :update_when, :edit_friends, :update_friends, :destroy]
  before_action :current_guest, only: [:edit_friends, :show]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @hosted_events = policy_scope(current_user.events)
    @invited_events = policy_scope(current_user.events_as_guest)
    # @today_events = policy_scope()
  end

  def show
    @user_is_host = @event.user == current_user
  end

  #METHODS USED FOR THE SIMPLE_FORM:
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
    @friends = current_user.friends
  end

  def update_friends
    @event.event_users.destroy_all
    params[:event][:friends].each do |user_id|
      EventUser.create(event: @event, user_id: user_id)
    end
    @event.status = :completed
    @event.save
    redirect_to event_path(@event)
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to root_path
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
