module LoginDefault
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      ominiauth_authentication(:google)
    end

    def passaporte_web
      # account = Account.find_by_subdomain(request.subdomain)
      # @user = User.find_for_passaporte_web_oauth(request.env["omniauth.auth"], current_user, account)
      # if @user
      #   flash[:success] = "Autenticado com sucesso via Passaporte Web."
      #   sign_in_and_redirect @user, :event => :authentication
      # else
      #   respond_to do |format|
      #     format.html { redirect_to new_user_session_path, :alert => "Usuário não encontrado" }
      #   end
      # end
      ominiauth_authentication(:passaporte_web)
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
