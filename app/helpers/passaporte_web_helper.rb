module PassaporteWebHelper
  def barra_passaporte_web
    if current_provider[:provider]=='passaporte_web'
      login_url = new_user_session_url #'/auth/passaporte_web'
      logout_url =  destroy_user_session_url #'/authentication/sign_out'
      js_script_url = "#{LOGIN_DEFAULT_CONFIG[:passaporte_web_url]}/navbar/#{LOGIN_DEFAULT_CONFIG[:passaporte_web_app_slug]}.js?login_url=#{CGI.escape(login_url)}&logout_url=#{CGI.escape(logout_url)}&push_it=false"
      concat(stylesheet_link_tag('login_default/passaporte_web.css'))
      concat(javascript_include_tag(js_script_url, 'login_default/passaporte_web.js'))
    end
  end
end