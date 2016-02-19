class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
