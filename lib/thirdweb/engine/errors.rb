# frozen_string_literal: true

module Thirdweb
  module Engine
    class Error < StandardError; end

    # Configuration errors
    class ConfigurationError < Error; end
    class MissingConfigurationError < ConfigurationError; end

    # API errors
    class APIError < Error
      attr_reader :status, :body

      def initialize(status, body)
        @status = status
        @body = body
        super("API Error: #{status} - #{body}")
      end
    end

    # Authentication errors
    class AuthenticationError < APIError; end

    # Not found errors
    class NotFoundError < APIError; end

    # Server errors
    class ServerError < APIError; end
  end
end 