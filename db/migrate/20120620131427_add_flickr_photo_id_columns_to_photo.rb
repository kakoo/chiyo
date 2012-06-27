class AddFlickrPhotoIdColumnsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :flickr_photo_id, :string
  end
end
