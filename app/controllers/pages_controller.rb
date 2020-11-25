class PagesController < ApplicationController
  def home
      @hosted_events = policy_scope(current_user.events)
      @invited_events = policy_scope(current_user.events_as_guest)
      authorize @hosted_events if @hosted_events.empty?
      authorize @invited_events if @invited_events.empty?
  end
end
