# frozen_string_literal: true

module Blog
  class Settings < Hanami::Settings
    setting :database_url, constructor: Types::String
    setting :secret_key, constructor: Types::String
  end
end
