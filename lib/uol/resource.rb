module Uol
  class Resource
    attr_accessor :client, :klass

    def initialize(client, klass = nil)
      @client = client
      @klass = klass
    end

    private

    def request(url, params: {}, headers: {}, type: 'avengers')
      handle_response(client.connection.get(url, params, headers), type)
    end

    def handle_response(response, type)
      case response.status
      when 200
        parse_response(response.body, type)
      end
    end

    def parse_response(body, type)
      case type
      when 'avengers'
        JSON.parse(body.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
      when 'justice_league'
        Hash.from_xml(body)
      else
        raise 'INVALID TYPE'
      end
    end
  end
end
