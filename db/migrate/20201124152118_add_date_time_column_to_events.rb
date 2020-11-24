class AddDateTimeColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date_time, :datetime
  end
end
