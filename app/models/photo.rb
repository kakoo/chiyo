require 'flickraw'
class Photo < ActiveRecord::Base
  attr_accessor :image
  attr_accessible :name, :title, :image

  belongs_to :user

  before_destroy do |r|
    r.user.flickr.photos.delete :photo_id => r.flickr_photo_id
  end

  before_create do |r|
    begin
      r.flickr_photo_id = r.user.flickr.upload_photo r.image.tempfile, :title => r.title
      r.user.flickr.photosets.addPhoto :photoset_id => "72157630312659872", :photo_id => r.flickr_photo_id
    rescue Exception => e
      false
    end
  end

  before_update do |r|
    if r.image.try(:tempfile)
      r.user.flickr.photos.delete :photo_id => r.flickr_photo_id

      r.flickr_photo_id = r.flickr.upload_photo r.image.tempfile, :title => r.title
      r.flickr.photosets.addPhoto :photoset_id => "72157630312659872", :photo_id => r.flickr_photo_id
    end
  end
end
