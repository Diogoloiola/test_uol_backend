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
        create_objects JSON.parse(body.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': '))
                           .symbolize_keys[:vingadores].pluck('codinome')
      when 'justice_league'
        create_objects Hash.from_xml(body)['liga_da_justica']['codinomes']['codinome']
      else
        raise 'INVALID TYPE'
      end
    end

    def create_objects(code_names)
      objects = []

      code_names.each do |code_name|
        objects << klass.new(code_name: code_name)
      end
      objects
    end
  end
end
