# frozen_string_literal: true

require "rack/test"

module RequestMethods
  def app
    Hanami.app
  end

  def logged_in(email: "user@example.com", password: "secret")
    register
    login
  end

  def register(email: "user@example.com", password: "secret", verify: true)
    post "/create-account", { login: email, password: password }.to_json, "CONTENT_TYPE" => "application/json"
    if verify
      key = Mail::TestMailer.deliveries.first.body.to_s[/verify-account\?key=(\S+)/, 1]
      post "/verify-account", { key: key }.to_json, "CONTENT_TYPE" => "application/json"
    end
  end

  def login(email: "user@example.com", password: "secret")
    post "/login", { login: email, password: password }.to_json, "CONTENT_TYPE" => "application/json"
  end

  def logout
    post "/logout", {}.to_json, "CONTENT_TYPE" => "application/json"
  end

  def json_response
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include RequestMethods, type: :request
end
