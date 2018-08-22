# frozen_string_literal: true

module EveOnline
  module ESI
    class Races < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/universe/races/?datasource=%<datasource>s&language=en-us'

      def races
        output = []
        response.each do |race|
          output << Models::Race.new(race)
        end
        output
      end
      memoize :races

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
