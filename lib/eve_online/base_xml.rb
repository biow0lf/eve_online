# frozen_string_literal: true

require 'nori'
require 'active_support/time'

module EveOnline
  class BaseXML < Base
    attr_reader :parser

    def initialize
      @parser = Nori.new(advanced_typecasting: false)
    end

    def result
      eveapi.fetch('result')
    end
    memoize :result

    def cached_until
      parse_datetime_with_timezone(eveapi.fetch('cachedUntil'))
    end
    memoize :cached_until

    def current_time
      parse_datetime_with_timezone(eveapi.fetch('currentTime'))
    end
    memoize :current_time

    def version
      eveapi.fetch('@version').to_i
    end
    memoize :version

    def eveapi
      response.fetch('eveapi')
    end
    memoize :eveapi

    private

    def parse_datetime_with_timezone(value)
      ActiveSupport::TimeZone['UTC'].parse(value)
    end
  end
end
