require 'flickraw'
class Photo < ActiveRecord::Base
  attr_accessor :image
  attr_accessible :name, :title, :image

  before_destroy do |r|
    flickr.photos.delete :photo_id => r.flickr_photo_id
  end

  before_create do |r|
    r.flickr_photo_id = flickr.upload_photo r.image.tempfile, :title => r.title, :description => r.name
    flickr.photosets.addPhoto :photoset_id => "72157630312659872", :photo_id => r.flickr_photo_id
  end

  before_update do |r|
    if r.image.tempfile
      flickr.photos.delete :photo_id => r.flickr_photo_id

      r.flickr_photo_id = flickr.upload_photo r.image.tempfile, :title => r.title, :description => r.name
      flickr.photosets.addPhoto :photoset_id => "72157630312659872", :photo_id => r.flickr_photo_id
    end
  end
end
