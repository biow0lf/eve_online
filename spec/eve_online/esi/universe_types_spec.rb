# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseTypes do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/universe/types/?datasource=%<datasource>s&page=%<page>s') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq(nil) }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:datasource) { should eq('tranquility') }

      its(:page) { should eq(1) }
    end

    context 'with options' do
      let(:options) { { page: 10 } }

      subject { described_class.new(options) }

      its(:page) { should eq(10) }
    end
  end

  describe '#universe_type_ids' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.universe_type_ids).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/types/?datasource=tranquility&page=1')
    end
  end
end
