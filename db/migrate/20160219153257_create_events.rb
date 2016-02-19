class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :datetime, null: false
      t.string :description
      t.integer :venue_id, null: false
      t.timestamps null: false
    end
  end
end
