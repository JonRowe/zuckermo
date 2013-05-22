module Zuckermo
  class AccountStore

    def init
      @app_id = nil
      @account_store ||= ACAccountStore.alloc.init
      self
    end

    attr_accessor :app_id
    attr_reader :account_store

    def account_type
      self.account_store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook)
    end

    def accounts
      self.account_store.accountsWithAccountType(account_type).collect do |ac_account|
        Zuckermo::User.new ac_account
      end
    end

    def sign_in permissions, audience, &block
      @permissions, @audience, @callback = permissions, audience, block

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
    end

  end
end
