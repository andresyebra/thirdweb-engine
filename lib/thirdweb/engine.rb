# frozen_string_literal: true

require_relative "engine/version"

require "dry-configurable"
require_relative "engine/version"
require_relative "engine/errors"
require_relative "engine/api"
require_relative "engine/configuration"
require_relative "engine/contract"
require_relative "engine/chain"
require_relative "engine/backend_wallet"
require_relative "engine/deploy"
require_relative "engine/erc721"

module Thirdweb
  module Engine
    extend Dry::Configurable

    setting :base_url, default: "https://thirdweb-engine.apidocumentation.com"
    setting :access_token, default: nil
    setting :network, default: "testnet"
    setting :chain, default: "ethereum"
    setting :chain_id, default: 1
    setting :backend_wallet_address, default: nil
  end
end
