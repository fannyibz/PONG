class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user: current_user, friend: User.find(params[:friend_id]))
    authorize @friendship
    @friendship.save
    redirect_to users_list_path
  end

  def toggle_favorite
    @friendship = Friendship.find(params[:id])

    authorize @friendship
    @friendship.favorite = !@friendship.favorite
    @friendship.save
    redirect_to dashboard_path
  end

end
