class EventUsersController < ApplicationController
  before_action :set_event_users

  def confirm
    @event_user.confirmed!
    if request.referer.include? "notifications_center"
      redirect_to notifications_center_path
    else
      redirect_to event_path(@event_user.event)
    end
  end

  def decline
    @event_user.declined!
    redirect_to root_path
  end

  private

  def set_event_users
    @event_user = EventUser.find(params[:id])
    authorize @event_user
  end
end
