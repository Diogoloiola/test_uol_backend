module Uol
  class Client

    BASE_URL = Rails.application.credentials.dig(Rails.env.to_sym, :base_url_uol)

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def avengers
      Uol::Api::Avengers.new(self, Uol::Models::SuperHero)
    end

    def justice_league
      Uol::Api::JusticeLeague.new(self, Uol::Models::SuperHero)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |con|
        con.adapter adapter
      end
    end
  end
end
