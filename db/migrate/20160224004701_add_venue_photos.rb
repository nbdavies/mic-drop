class AddVenuePhotos < ActiveRecord::Migration
  def change
    add_attachment :venues, :photo
  end
end
