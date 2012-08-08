class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :authenticate_user!

  def flickr
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    #@user = User.find_for_flickr_oauth(request.env["omniauth.auth"], current_user)

    current_user.update_attributes(
        :flickr_uid => request.env["omniauth.auth"].uid,
        :flickr_token => request.env["omniauth.auth"].credentials.token,
        :flickr_secret => request.env["omniauth.auth"].credentials.secret
    )

    if current_user.flickr.photosets.getList.size > 0
      current_user.update_attribute(:flickr_photoset_id, current_user.flickr.photosets.getList.first.id)
    end


    redirect_to edit_user_registration_path
  end
end