OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_app_id'], ENV['facebook_app_secret_id']#, :scope => 'email,location,age,first_name,last_name', :display => 'popup'
end