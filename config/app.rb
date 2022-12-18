# frozen_string_literal: true

require "hanami"
require "blog/rodauth_middleware"

module Blog
  class App < Hanami::App
    config.actions.sessions = [:cookie,
      key: "app_prototype.session",
      secret: settings.secret_key,
      expire_after: 60 * 60 * 24 * 365 # 1 year
    ]

    config.middleware.use Blog::RodauthMiddleware
  end
end
