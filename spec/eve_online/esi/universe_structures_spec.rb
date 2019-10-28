# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseStructures do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v1/universe/structures/') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq(nil) }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
        its(:_write_timeout) { should eq(60) }
      end

      its(:datasource) { should eq('tranquility') }

      its(:filter) { should eq(nil) }
    end

    context 'with options' do
      let(:options) { { filter: 'market' } }

      subject { described_class.new(options) }

      its(:filter) { should eq('market') }
    end
  end

  describe '#structure_ids' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.structure_ids).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#additional_query_params' do
    specify { expect(subject.additional_query_params).to eq([:filter]) }
  end

  describe '#path' do
    specify do
      expect(subject.path).to eq('/v1/universe/structures/')
    end
  end

  describe '#query' do
    context 'without filter' do
      specify do
        expect(subject.query).to eq(datasource: 'tranquility')
      end
    end

    context 'with filter' do
      let(:options) { { filter: 'market' } }

      subject { described_class.new(options) }

      specify do
        expect(subject.query).to eq(datasource: 'tranquility', filter: 'market')
      end
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/structures/?datasource=tranquility')
    end
  end
end
