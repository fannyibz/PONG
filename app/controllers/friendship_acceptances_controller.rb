class FriendshipAcceptancesController < ApplicationController
  def create
    # @friendship = Friendship.find_by(user: current_user, friend_id: params[:friend_id])
    @friendship = Friendship.find_by(friend_id: current_user.id, user: invitor)
    authorize @friendship
    @friendship.update(status: "approved")
    redirect_to users_list_path
  end

  private

  def invitor
    User.find(params[:invitor_id])
  end
end
