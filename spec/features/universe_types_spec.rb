# frozen_string_literal: true

require 'spec_helper'

describe 'Get types' do
  before { VCR.insert_cassette 'esi/universe/types' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseTypes.new }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(35) }

  specify { expect(subject.universe_types_ids.size).to eq(1000) }

  specify { expect(subject.universe_types_ids.first).to eq(0) }
end