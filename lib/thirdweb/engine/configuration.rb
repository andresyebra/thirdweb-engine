# frozen_string_literal: true

module Thirdweb
  module Engine
    class Configuration
      class << self
        # @return [Array<Hash{Symbol => Object}>]
        def wallets
          Api.instance.get("/configuration/wallets").body
        end
      end
    end
  end
end 