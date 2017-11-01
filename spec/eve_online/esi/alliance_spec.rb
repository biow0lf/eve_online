require 'spec_helper'

describe EveOnline::ESI::Alliance do
  let(:options) { { alliance_id: 99_005_443 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/alliances/%s/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:alliance_id) { should eq(99_005_443) }
  end

  describe '#model' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    let(:model) { double }

    before do
      #
      # EveOnline::ESI::Models::Alliance.new(response) # => model
      #
      expect(EveOnline::ESI::Models::Alliance).to receive(:new).with(response).and_return(model)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#as_json' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#alliance_name' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:alliance_name) }

    specify { expect { subject.alliance_name }.not_to raise_error }
  end

  describe '#ticker' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:ticker) }

    specify { expect { subject.ticker }.not_to raise_error }
  end

  describe '#date_founded' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:date_founded) }

    specify { expect { subject.date_founded }.not_to raise_error }
  end

  describe '#executor_corp' do
    let(:model) { double }

    before { subject.instance_variable_set(:@_memoized_model, model) }

    before { expect(model).to receive(:executor_corp) }

    specify { expect { subject.executor_corp }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v2/alliances/99005443/?datasource=tranquility')
    end
  end
end
