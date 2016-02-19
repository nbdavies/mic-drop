class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :venue_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
