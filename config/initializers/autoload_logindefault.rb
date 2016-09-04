file_yml = "#{Rails.root.to_s}/config/login_default.yml"
if File.exist?(file_yml)
  login_default_config = YAML.load_file(file_yml)[Rails.env]
  LOGIN_DEFAULT_CONFIG = login_default_config.symbolize_keys
else
  #raise 'login_default.yml, não existe ou é inválido. Verifique o arquivo ou reinstale a GEM'
end