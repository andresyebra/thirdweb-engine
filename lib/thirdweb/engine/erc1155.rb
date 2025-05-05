# frozen_string_literal: true

module Thirdweb
  module Engine
    class ERC1155
      class << self
        # @param [String] contract_address
        # @param [String] receiver
        # @param [Hash{Symbol => Object}] metadata
        # @return [Hash{Symbol => Object}]
        def mint(contract_address:, receiver:, **metadata)
          payload = {
            receiver: receiver,
            metadata: metadata
          }

          Api.instance.post("/contract/#{Thirdweb::Engine.config.chain_id}/#{contract_address}/erc1155/mint-to", payload).body
        end

        # @param [String] contract_address
        # @param [Array<Hash{Symbol => Object}>] metadatas
        # @return [Hash{Symbol => Object}] The token IDs of the minted tokens
        def lazy_mint(contract_address:, metadatas:)
          payload = {
            metadatas: metadatas
          }

          Api.instance.post("/contract/#{Thirdweb::Engine.config.chain_id}/#{contract_address}/erc1155/lazy-mint", payload).body
        end

        # @param [String] contract_address
        # @param [String] receiver
        # @param [Integer] quantity
        # @return [Hash{Symbol => Object}]
        def claim(contract_address:, receiver:, quantity: 1)
          payload = {
            receiver: receiver,
            quantity: quantity
          }

          Api.instance.post("/contract/#{Thirdweb::Engine.config.chain_id}/#{contract_address}/erc1155/claim-to", payload).body
        end
      end
    end
  end
end 