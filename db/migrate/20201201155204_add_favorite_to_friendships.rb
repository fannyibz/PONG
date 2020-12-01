class AddFavoriteToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :favorite, :boolean, default: false
  end
end
