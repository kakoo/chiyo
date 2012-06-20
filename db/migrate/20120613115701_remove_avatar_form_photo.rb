class RemoveAvatarFormPhoto < ActiveRecord::Migration
  def up
    #t.string   "avatar_file_name"
    #t.string   "avatar_content_type"
    #t.integer  "avatar_file_size"
    #t.datetime "avatar_updated_at"
    remove_column :photos, :avatar_file_name
    remove_column :photos, :avatar_content_type
    remove_column :photos, :avatar_file_size
    remove_column :photos, :avatar_updated_at
  end

  def down
    add_column :photos, :avatar_content_type, :string
    add_column :photos, :avatar_file_size,    :integer
    add_column :photos, :avatar_updated_at,    :datetime
    add_column :photos, :avatar_file_name,     :string
  end
end
