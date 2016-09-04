module LoginDefault
  module User
    extend ActiveSupport::Concern
    include Devise::Controllers::Helpers

    included do
      devise :database_authenticatable, :recoverable, :invitable, :rememberable, :trackable, :validatable, :omniauthable, {:omniauth_providers => [:google_oauth2, :passaporte_web]}
    end

    module ClassMethods
      def from_omniauth(access_token)
        data = access_token.info
        user = ::User.where(:email => data["email"]).first if data
        # Uncomment the section below if you want users to be created if they don't exist
        # unless user
        #     user = User.create(name: data["name"],
        #        email: data["email"],
        #        password: Devise.friendly_token[0,20]
        #     )
        # end
        user
      end
    end
  end
end
