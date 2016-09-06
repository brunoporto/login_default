$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "login_default/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "login_default"
  s.version     = LoginDefault::VERSION
  s.authors     = ["Bruno Porto"]
  s.email       = ["brunotporto@gmail.com"]
  s.homepage    = "http://www.brunoporto.com.br/"
  s.summary     = "GEM para unificação do sistema de autenticação baseado em Devise"
  s.description = "Essa gem implementa a autenticação via Devise e possibilita que você possa usar autenticação interna, Google e Outros"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'
  s.add_dependency 'devise', '~> 4.2'
  s.add_dependency 'devise_invitable', '~> 1.7'
  s.add_dependency 'haml',  '~> 4.0'
  s.add_dependency 'unobtrusive_flash'

  # Things that devise needs.
  s.add_dependency 'tzinfo'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-google-oauth2'
end
