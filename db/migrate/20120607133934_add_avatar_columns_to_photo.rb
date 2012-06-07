class AddAvatarColumnsToPhoto < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :photos, :avatar
  end
end
