class FriendshipAcceptancesController < ApplicationController
  def create
# Methode pour créer la frienship depuis l'app de celui qui demande.    
    # @friendship = Friendship.find_by(user: current_user, friend_id: params[:friend_id])
    @friendship = Friendship.find_by(friend_id: current_user.id, user: invitor)
    authorize @friendship
    @friendship.update(status: "approved")
# Methode pour créer la frienship depuis l'app de celui qui accepte.
    @friendship_mutual = Friendship.new(user: current_user, friend: invitor)
    @friendship_mutual.update(status: "approved")
    if request.referer.include? "notifications_center"
      redirect_to notifications_center_path
    else
      redirect_to users_list_path
    end
  end

  private

  def invitor
    User.find(params[:invitor_id])
  end
end
