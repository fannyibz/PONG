class RemoveColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date, :date
    remove_column :events, :hour, :time
  end
end
