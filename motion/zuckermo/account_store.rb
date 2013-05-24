module Zuckermo
  class AccountStore

    def init
      @app_id = nil
      @account_store ||= ACAccountStore.alloc.init
      self
    end

    attr_accessor :app_id
    attr_reader :account_store

    def facebook_supported?
      UIDevice.currentDevice.systemVersion.to_f >= 6
    end

    def account_type
      if facebook_supported?
        self.account_store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook)
      else
        nil
      end
    end

    def accounts
      (self.account_store.accountsWithAccountType(account_type) || []).collect do |ac_account|
        Zuckermo::User.new ac_account
      end
    end

    def sign_in permissions, audience, &block
      @permissions, @audience, @callback = permissions, audience, block

      if facebook_supported?
        @options =
          {
            ACFacebookAppIdKey       => @app_id,
            ACFacebookPermissionsKey => @permissions
          }

        self.account_store.requestAccessToAccountsWithType( self.account_type,
            options: @options,
            completion: -> granted, error do
              Dispatch::Queue.main.sync do
                @callback.call(granted, error)
              end
            end
        )
      else
        @callback.call false, unsupported_error
      end
    end

    private

      def unsupported_error
        NSError.errorWithDomain('com.zuckermo.unsupported_ios_version', code: 0, userInfo:nil)
      end

  end
end
