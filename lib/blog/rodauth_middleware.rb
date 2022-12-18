module Blog
  class RodauthMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      Blog::RodauthApp.new(@app).call(env)
    end
  end
end
