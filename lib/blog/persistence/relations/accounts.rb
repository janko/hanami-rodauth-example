module Blog
  module Persistence
    module Relations
      class Accounts < ROM::Relation[:sql]
        schema(:accounts, infer: true)
        auto_struct(true)
      end
    end
  end
end
