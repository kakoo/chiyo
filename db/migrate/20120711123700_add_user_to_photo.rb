class AddUserToPhoto < ActiveRecord::Migration

 def self.up
    add_column :photos, :user_id, :integer
    remove_column :photos, :name
    user = User.all.first
    Photo.all.each {|photo| photo.update_attribute :user_id, user.id} unless user.nil?
  end

  def self.down
    remove_column :photos, :user_id
    add_column :photos, :name, :string
    Photo.all.each {|photo| photo.update_attribute :name, 'Kakoo'}
  end
end
