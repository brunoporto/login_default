require 'omniauth-google-oauth2'
require 'omni_auth_passaporte_web'
require 'devise/orm/active_record'
require 'yaml'
require 'securerandom'

Devise.setup do |config|
  config.omniauth :google_oauth2, LOGIN_DEFAULT_CONFIG[:google_client_id], LOGIN_DEFAULT_CONFIG[:google_client_secret], {}
  config.omniauth :passaporte_web, LOGIN_DEFAULT_CONFIG[:passaporte_web_app_id], LOGIN_DEFAULT_CONFIG[:passaporte_web_app_secret], client_options: {site: LOGIN_DEFAULT_CONFIG[:passaporte_web_url]}
  config.secret_key = SecureRandom.hex(64)
  config.sign_out_via = [:get, :delete]
  # config.parent_controller = 'ApplicationController'
  # config.router_name = :login_default
end