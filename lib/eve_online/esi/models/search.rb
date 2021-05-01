# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Search < Base
        def as_json
          {
            agent: agent,
            alliance: alliance,
            character: character,
            constellation: constellation,
            corporation: corporation,
            faction: faction,
            inventory_type: inventory_type,
            region: region,
            solar_system: solar_system,
            station: station
          }.reject{ |_,v| v.blank? }
        end

        def agent
          options["agent"]
        end

        def alliance
          options["alliance"]
        end

        def character
          options["character"]
        end

        def constellation
          options["constellation"]
        end

        def corporation
          options["corporation"]
        end

        def faction
          options["faction"]
        end

        def inventory_type
          options["inventory_type"]
        end

        def region
          options["region"]
        end

        def solar_system
          options["solar_system"]
        end

        def station
          options["stations"]
        end
      end
    end
  end
end
