class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :components

  def components
     authorize(:page, :components?)
  end

  def home
    @hosted_events = policy_scope(current_user.events)
    @invited_events = policy_scope(current_user.events_as_guest)
    # authorize @hosted_events if @hosted_events.empty?
    # authorize @invited_events if @invited_events.empty?

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = (@hosted_events.geocoded + @invited_events.geocoded).map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url(Cloudinary::Utils.cloudinary_url(event.user.avatar.key)),
        emoji: event.emoji
      }
    end
  end
end
# 'cl_image_tag event.user.avatar.key'
# participant: event. nb de participants
# event_user.status = joining
