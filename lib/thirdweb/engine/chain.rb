# frozen_string_literal: true

module Thirdweb
  module Engine
    class Chain
      class << self
        # @return [Array<Hash{Symbol => Object}>]
        def get_all
          Api.instance.get("/chain/get-all").body
        end

        # @param [String] chain_id
        # @return [Hash{Symbol => Object}]
        def get(chain_id:)
          params = { 
            chain: chain_id 
          }

          Api.instance.get("/chain/get", params).body
        end
      end
    end
  end
end 