class ChangeStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :friendships, :status, :string, default: "pending"
  end
end
