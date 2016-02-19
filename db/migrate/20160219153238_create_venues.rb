class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :location, null: false
      t.string :name, null: false
      t.integer :type_id
      t.integer :manager_id, null: false
      t.timestamps null: false
    end
  end
end
