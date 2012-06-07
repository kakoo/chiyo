class Photo < ActiveRecord::Base
  attr_accessible :name, :title, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
