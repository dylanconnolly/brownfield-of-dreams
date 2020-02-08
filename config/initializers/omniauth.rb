Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  provider :github, ENV['LOCAL_GITHUB_CLIENT_ID'], ENV['LOCAL_GITHUB_CLIENT_SECRET']
end
