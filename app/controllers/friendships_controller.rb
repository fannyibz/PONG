class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user: current_user, friend: User.find(params[:friend_id]))
    authorize @friendship
    @friendship.save
    redirect_to users_list_path
  end
end
