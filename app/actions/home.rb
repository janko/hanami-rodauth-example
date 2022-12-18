module Blog
  module Actions
    class Home < Blog::Action
      def handle(request, response)
        account = current_account(request)

        response.body = Resources::Account.new(account).serialize
      end
    end
  end
end
