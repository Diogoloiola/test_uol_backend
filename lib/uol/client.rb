module Uol
  class Client

    BASE_URL = Rails.application.credentials.dig(Rails.env.to_sym, :base_url_uol)

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def avengers
      Uol::Api::Avengers.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |con|
        con.adapter adapter
      end
    end
  end
end
