# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationKillmailsRecent < Base
      API_PATH = "/v1/corporations/%<corporation_id>s/killmails/recent/"

      attr_reader :corporation_id, :page

      def initialize(options = {})
        super

        @corporation_id = options.fetch(:corporation_id)
        @page = options.fetch(:page, 1)
      end

      def killmails
        @killmails ||=
          begin
            output = []
            response.each do |killmail|
              output << Models::KillmailShort.new(killmail)
            end
            output
          end
      end

      def scope
        "esi-killmails.read_corporation_killmails.v1"
      end

      def roles
        ["Director"]
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end
