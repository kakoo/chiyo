require 'flickraw'
class Photo < ActiveRecord::Base
  attr_accessible :name, :title, :flickr_photo_id

  before_destroy :delete_flickr_photo

  def delete_flickr_photo
    flickr.photos.delete :photo_id => self.flickr_photo_id
  end
end
