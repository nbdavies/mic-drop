class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email
      t.string :facebook_id
      t.string :picture_url
      t.timestamps null: false
    end
  end
end
