module LoginDefault
  class Engine < ::Rails::Engine
    config.to_prepare do
      DeviseController.send :include, UnobtrusiveFlash::ControllerMixin
      DeviseController.after_filter :prepare_unobtrusive_flash
      Devise::SessionsController.layout 'login_default/login'
      Devise::RegistrationsController.layout 'login_default/login' #proc{ |controller| user_signed_in? ? "application" : "devise" }
      Devise::ConfirmationsController.layout 'login_default/login'
      Devise::UnlocksController.layout 'login_default/login'
      Devise::PasswordsController.layout 'login_default/login'
      Devise::InvitationsController.layout 'login_default/login'
    end
  end
end
