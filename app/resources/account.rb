require "alba"

module Blog
  module Resources
    class Account
      include Alba::Resource

      STATUSES = { 1 => :unverified, 2 => :verified, 3 => :closed }

      attributes :id, :email
      attribute :status do |account|
        STATUSES.fetch(account.status)
      end
    end
  end
end
