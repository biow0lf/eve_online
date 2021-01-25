require 'memoist'

module EveOnline
  class EveOnline
    extend Memoist

    attr_reader :key_id, :v_code

    def initialize(key_id, v_code)
      @key_id = key_id
      @v_code = v_code
    end

    def account_status
      Account::Status.new(key_id, v_code)
    end
    memoize :account_status

    def characters
      Account::Characters.new(key_id, v_code).characters
    end
    memoize :characters
  end
end
