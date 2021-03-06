# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterClones < Base
      API_PATH = "/v3/characters/%<character_id>s/clones/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def home_location
        @home_location ||= Models::HomeLocation.new(response["home_location"])
      end

      def jump_clones
        @jump_clones ||=
          begin
            output = []
            response["jump_clones"].each do |jump_clone|
              output << Models::JumpClone.new(jump_clone)
            end
            output
          end
      end

      def last_clone_jump_date
        last_clone_jump_date = response["last_clone_jump_date"]

        parse_datetime_with_timezone(last_clone_jump_date) if last_clone_jump_date
      end

      def last_station_change_date
        last_station_change_date = response["last_station_change_date"]

        parse_datetime_with_timezone(last_station_change_date) if last_station_change_date
      end

      def scope
        "esi-clones.read_clones.v1"
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end
