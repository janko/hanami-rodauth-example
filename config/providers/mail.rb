Hanami.app.register_provider :mail do
  prepare do
    require "mail"

    Mail.defaults do
      if Hanami.env?(:development)
        delivery_method :logger
      end
    end
  end
end
