# frozen_string_literal: true

module Thirdweb
  module Engine
    class Contract
      class << self
        # @para,s
        def read(contract_address:)
          Api.instance.post("/contract/#{Thirdweb::Engine.config.chain_id}/#{contract_address}/read").body
        end
        end
    end
  end
end 