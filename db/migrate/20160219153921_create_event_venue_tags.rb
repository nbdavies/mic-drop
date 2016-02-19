class CreateEventVenueTags < ActiveRecord::Migration
  def change
    create_table :event_venue_tags do |t|
      t.integer :taggable_id, null: false
      t.string :taggable_type, null: false
      t.integer :tag_id, null: false
      t.timestamps null: false
    end
  end
end
