# frozen_string_literal: true

module Thirdweb
  module Engine
    class BackendWallet
      class << self
        # @return [Array<Hash{Symbol => Object}>]
        def get_all
          Api.instance.get("/backend-wallet/get-all").body
        end
      end
    end
  end
end 