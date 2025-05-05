# frozen_string_literal: true

require "faraday"
require "faraday/retry"

module Thirdweb
  module Engine
    class Api
      class << self
        # @return [Api]
        def instance
          @instance ||= new
        end
      end

      # @return [Faraday::Connection]
      def initialize
        @connection = Faraday.new(url: Thirdweb::Engine.config.base_url) do |c|
          c.request :json
          c.response :json
          c.use Faraday::Retry::Middleware
          c.adapter Faraday.default_adapter
          c.headers = headers
        end
      end

      # @param [String] path
      # @param [Hash{Symbol->Object}] params
      # @return [Hash{Symbol->Object}]
      def get(path, params = {})
        handle_response do
          @connection.get(path, params)
        end
      end

      # @param [String] path
      # @param [Hash{Symbol->Object}] body
      # @return [Hash{Symbol->Object}]
      def post(path, body = {})
        handle_response do
          @connection.post(path, body)
        end
      end

      private

      # @return [Hash{Symbol->Object}]
      def headers
        {
          "Authorization" => "Bearer #{Thirdweb::Engine.config.access_token}",
          "x-backend-wallet-address" => Thirdweb::Engine.config.backend_wallet_address,
          "Content-Type" => "application/json"
        }
      end

      # @return [Hash{Symbol->Object}]
      def handle_response
        response = yield
        case response.status
        when 200..299
          response
        when 400
          raise Thirdweb::Engine::BadRequestError.new(response.status, response.body)
        when 401
          raise Thirdweb::Engine::UnauthorizedError.new(response.status, response.body)
        when 404
          raise Thirdweb::Engine::NotFoundError.new(response.status, response.body)
        when 500..599
          raise Thirdweb::Engine::ServerError.new(response.status, response.body)
        else
          raise Thirdweb::Engine::APIError.new(response.status, response.body)
        end
      rescue Faraday::Error => e
        raise Thirdweb::Engine::Error, "Network error: #{e.message}"
      end
    end
  end
end
