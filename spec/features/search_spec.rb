# frozen_string_literal: true

require "spec_helper"

describe "Search for a resource" do
  context "when etag not set" do
    let(:options) do
      {
        search: "Jita",
        categories: ["solar_system"],
        strict: true
      }
    end

    before { VCR.insert_cassette "esi/search" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Search.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.solar_system.size).to eq(1) }

    specify { expect(subject.as_json).to eq(solar_system: [30000142]) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(52) }

    specify { expect(subject.etag).to eq("fe8f7a2c7e0b10825f52961747c22b7522b499af4e0e51b6cb28bee3") }
  end

  context "when etag is set" do
    let(:options) do
      {
        search: "Jita",
        categories: ["solar_system"],
        strict: true,
        etag: "fe8f7a2c7e0b10825f52961747c22b7522b499af4e0e51b6cb28bee3"
      }
    end

    before { VCR.insert_cassette "esi/search_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Search.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("fe8f7a2c7e0b10825f52961747c22b7522b499af4e0e51b6cb28bee3") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(50) }
  end
end
