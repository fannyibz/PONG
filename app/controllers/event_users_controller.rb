class EventUsersController < ApplicationController
  before_action :set_event_users

  def confirm
    @event_user.confirmed!
    redirect_to event_path(@event_user.event)
  end

  def decline
    @event_user.declined!
    redirect_to event_path(@event_user.event)
  end

  private

  def set_event_users
    @event_user = EventUser.find(params[:id])
    authorize @event_user
  end
end
