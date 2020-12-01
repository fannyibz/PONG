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

    @hosted_events.each do |event|
      difference = -(event.date_time - DateTime.now)
      event.destroy if difference >= 36000 # au bout de 10h, l'event se supprime par défaut (36000 sec)
    end

    @invited_events.each do |event|
      difference = -(event.date_time - DateTime.now)
      event.destroy if difference >= 36000 # au bout de 10h, l'event se supprime par défaut (36000 sec)
    end

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = (@hosted_events.geocoded + @invited_events.geocoded).map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url(Cloudinary::Utils.cloudinary_url(event.user.avatar.key)),
        emoji: event.emoji,
        joined: event.user == current_user || event.event_users.confirmed.pluck(:user_id).include?(current_user.id)
      }
    end
  end

  def dashboard
    authorize(:page, :dashboard?)
  end

  def users_list
    authorize(:page, :users_list?)
    @users = User.all.except{ |user| user == current_user }
  end
end

# 'cl_image_tag event.user.avatar.key'
# participant: event. nb de participants
# event_user.status = joining
