# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Blog
  class Action < Hanami::Action
    include Deps["persistence.rom"]

    config.format :json

    private

    def current_account(request)
      return unless request.env["rodauth"].logged_in?

      account_id = request.env["rodauth"].session_value
      rom.relations[:accounts].fetch(account_id)
    end
  end
end
