class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :emoji
      t.string :address
      t.date :date
      t.time :hour
      t.text :description
      t.boolean :open, default: false

      t.timestamps
    end
  end
end
