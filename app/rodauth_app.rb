require "roda"

module Blog
  class RodauthApp < Roda
    plugin :middleware
    plugin :render, layout: false
    plugin :rodauth, json: :only do
      enable :login, :logout, :verify_account, :json

      hmac_secret Hanami.app["settings"].secret_key

      account_status_column :status
      account_password_hash_column :password_hash # store password hashes in "accounts" table

      require_login_confirmation? false
      require_password_confirmation? false

      verify_account_set_password? false
    end

    route do |r|
      env["rodauth"] = rodauth # expose rodauth object in the main app

      r.rodauth

      rodauth.require_authentication
    end
  end
end
