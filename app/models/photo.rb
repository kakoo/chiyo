class Photo < ActiveRecord::Base
  attr_accessible :name, :title, :flickr_photo_id
end
