class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flickr_uid, :string
    add_column :users, :flickr_token, :string
    add_column :users, :flickr_secret, :string
    add_column :users, :flickr_photoset_id, :string
  end
end
