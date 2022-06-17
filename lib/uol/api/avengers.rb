module Uol
  module Api
    class Avengers < Resource
      def all
        request('vingadores.json')
      end
    end
  end
end
