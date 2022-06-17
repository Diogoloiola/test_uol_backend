module Uol
  module Api
    class JusticeLeague < Resource
      def all
        request('liga_da_justica.xml', type: 'justice_league')
      end
    end
  end
end
