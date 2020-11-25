class EventsController < ApplicationController
  before_action :find_event, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @events = Event.all
  end

  def show
    authorize @event
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
end
