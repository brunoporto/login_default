Rails.application.routes.draw do
  devise_for :users, path: 'authentication',
             controllers: {
               omniauth_callbacks:  'login_default/omniauth_callbacks',
               registrations:       'login_default/registrations',
               confirmations:       'login_default/confirmations',
               invitations:         'login_default/invitations',
               sessions:            'login_default/sessions',
               passwords:           'login_default/passwords',
               unlocks:             'login_default/unlocks'
             }
end
