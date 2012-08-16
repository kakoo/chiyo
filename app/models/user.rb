class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :photos

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :flickr_photoset_id, :flickr_secret, :flickr_token, :flickr_uid
  # attr_accessible :title, :body

  #def self.find_for_flickr_oauth(auth, signed_in_resource=nil)
  #  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #  unless user
  #    user = User.create(provider:auth.provider,
  #                       uid:auth.uid,
  #                       email:auth.info.email,
  #                       password:Devise.friendly_token[0,20]
  #    )
  #  end
  #  user
  #end

  @flickr = nil

  def flickr
    if flickr?
      if @flickr.nil?
        @flickr = FlickRaw::Flickr.new
        @flickr.access_token = flickr_token
        @flickr.access_secret = flickr_secret
        @flickr.test.login
        @flickr
      else
        @flickr
      end
    else
      raise "You have to oauth Flickr first."
    end
  end

  def flickr?
    !!self.flickr_token
  end
end
