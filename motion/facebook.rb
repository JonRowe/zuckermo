module Facebook
  class << self

    def supported?
      zuckermo.facebook_supported?
    end

    def app_id= id
      zuckermo.app_id = id
    end

    def account_store
      zuckermo.account_store
    end

    def account_type
      zuckermo.account_type
    end

    def accounts
      zuckermo.accounts
    end

    def sign_in permissions = ['email'], audience = nil,  &block
      zuckermo.sign_in permissions, audience, &block
    end

    private
      def zuckermo
        @zuckermo ||= Zuckermo::AccountStore.alloc.init
      end
  end
end
