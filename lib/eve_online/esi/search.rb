# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class Search < Base
      extend Forwardable

      API_PATH = "/v2/search/"

      attr_reader :search, :categories, :strict

      def initialize(options)
        super

        @search = options.fetch(:search)
        @strict = options.fetch(:strict, false)
        @categories = options.fetch(:categories)
        if @categories.is_a? Array
          @categories = @categories.join(',')
        end
      end

      def_delegators :model, :as_json, :agent, :alliance,
        :character, :constellation, :corporation, :faction,
        :inventory_type, :region, :solar_system, :station

      def model
        @model ||= Models::Search.new(response)
      end

      def scope
      end

      def additional_query_params
        [:search, :categories, :strict]
      end

      def path
        format(API_PATH, search: search, categories: categories, strict: strict)
      end
    end
  end
end
