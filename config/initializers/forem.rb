Forem.user_class = 'Member'
Forem.email_from_address = "please-change-me@example.com"

require 'forem'
module Forem
  module Theme
    module Base
      class Engine < Rails::Engine
        Forem.theme = :base
      end
    end
  end
end
