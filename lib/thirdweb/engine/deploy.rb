# frozen_string_literal: true

module Thirdweb
  module Engine
    class Deploy
      class << self
        # @param [Hash{Symbol->Object}] contract_metadata
        # @return [Hash{Symbol->Object}]
        def nft_collection(**contract_metadata)
          payload = {
            contractMetadata: contract_metadata
          }

          Api.instance.post("deploy/#{Thirdweb::Engine.config.chain_id}/prebuilts/nft-collection", payload).body
        end

        # @param [Hash{Symbol->Object}] contract_metadata
        # @return [Hash{Symbol->Object}]
        def nft_drop(**contract_metadata)
          payload = {
            contractMetadata: contract_metadata
          }

          Api.instance.post("deploy/#{Thirdweb::Engine.config.chain_id}/prebuilts/nft-drop", payload).body
        end
      end
    end
  end
end
