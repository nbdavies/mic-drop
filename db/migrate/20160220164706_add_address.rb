class AddAddress < ActiveRecord::Migration
  def change
    add_column :venues, :address, :string
  end
end
