OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'facebook_app_id', 'facebook_app_secret_id'
end