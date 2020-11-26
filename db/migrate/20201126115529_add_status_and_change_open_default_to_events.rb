class AddStatusAndChangeOpenDefaultToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :status, :integer
    change_column_default :events, :open, from: false, to: true
  end
end
