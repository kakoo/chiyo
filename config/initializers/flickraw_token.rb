FlickRaw.api_key="11f626355c7798e5d52f42ca8e1a49a0"
FlickRaw.shared_secret="9611e9c0d9f7c3d7"

Devise.setup do |config|
  config.omniauth :flickr, FlickRaw.api_key, FlickRaw.shared_secret
end