require 'rails'
require 'devise'
require 'devise_invitable'
require 'unobtrusive_flash'

require 'login_default/helpers/configuration'
require 'login_default/engine'
require 'login_default/user'

module LoginDefault
  extend Configuration

  define_setting :app_name, 'Sistema da MeuSistema'
  define_setting :logo_file_name, 'login_default.png'
  define_setting :enable_google, true
  define_setting :enable_passaporte_web, true
  define_setting :enable_create_account, false
  define_setting :url_create_account, 'http://www.taxweb.com.br/'

end
