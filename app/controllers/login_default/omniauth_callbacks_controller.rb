module LoginDefault
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      ominiauth_authentication(:google)
    end

    private
    def ominiauth_authentication(provider)
      session[:provider_info]=request.env["omniauth.auth"].info.to_h
      session[:provider_info][:provider]=provider.to_s
      @user = ::User.from_omniauth(request.env["omniauth.auth"])
      if @user.present? and @user.persisted?
        flash[:success] = I18n.t "devise.omniauth_callbacks.success", :kind => provider.to_s.humanize.titleize
        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:warning]='Usuário não cadastrado no sistema.'
        redirect_to new_user_session_path
      end

    end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end
  end
end
