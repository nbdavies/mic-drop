class CreateEventVenueTags < ActiveRecord::Migration
  def change
    create_table :event_venue_tags do |t|

      t.timestamps null: false
    end
  end
end
