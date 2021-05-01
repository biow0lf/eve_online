# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Search do
  let(:options) { { search: "Jita", categories: ["solar_system"] } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/search/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq(nil) }

      its(:strict) { should eq(false) }

      its(:search) { should eq("Jita") }

      its(:categories) { should eq("solar_system") }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }
    end

    context "with options" do
      let(:options) { { search: "Jita", categories: ["solar_system", "station"], strict: true } }

      its(:token) { should eq(nil) }

      its(:strict) { should eq(true) }

      its(:search) { should eq("Jita") }

      its(:categories) { should eq("solar_system,station") }
    end
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Search) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Search) }

      before do
        #
        # EveOnline::ESI::Models::Search.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Search).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#agent" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:agent) }

    specify { expect { subject.agent }.not_to raise_error }
  end

  describe "#alliance" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:alliance) }

    specify { expect { subject.alliance }.not_to raise_error }
  end

  describe "#character" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:character) }

    specify { expect { subject.character }.not_to raise_error }
  end

  describe "#constellation" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:constellation) }

    specify { expect { subject.constellation }.not_to raise_error }
  end

  describe "#corporation" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:corporation) }

    specify { expect { subject.corporation }.not_to raise_error }
  end

  describe "#faction" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:faction) }

    specify { expect { subject.faction }.not_to raise_error }
  end

  describe "#inventory_type" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:inventory_type) }

    specify { expect { subject.inventory_type }.not_to raise_error }
  end

  describe "#region" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:region) }

    specify { expect { subject.region }.not_to raise_error }
  end

  describe "#solar_system" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:solar_system) }

    specify { expect { subject.solar_system }.not_to raise_error }
  end

  describe "#station" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:station) }

    specify { expect { subject.station }.not_to raise_error }
  end
end
