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
        if type == 'avengers'
          JSON.parse(response.body.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
        else
          
        end
      end
    end
  end
end
