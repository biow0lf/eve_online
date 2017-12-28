require 'spec_helper'

describe EveOnline::ESI::Models::CharacterOrder do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:character_order) { described_class.new(options) }

    let(:issued) { double }

    before { expect(character_order).to receive(:order_id).and_return(123) }

    before { expect(character_order).to receive(:type_id).and_return(456) }

    before { expect(character_order).to receive(:region_id).and_return(123) }

    before { expect(character_order).to receive(:location_id).and_return(456) }

    before { expect(character_order).to receive(:range).and_return('station') }

    before { expect(character_order).to receive(:is_buy_order).and_return(true) }

    before { expect(character_order).to receive(:price).and_return(33.3) }

    before { expect(character_order).to receive(:volume_total).and_return(123456) }

    before { expect(character_order).to receive(:volume_remain).and_return(4422) }

    before { expect(character_order).to receive(:issued).and_return(issued) }

    before { expect(character_order).to receive(:state).and_return('open') }

    before { expect(character_order).to receive(:min_volume).and_return(1) }

    before { expect(character_order).to receive(:account_id).and_return(1000) }

    before { expect(character_order).to receive(:duration).and_return(30) }

    before { expect(character_order).to receive(:is_corp).and_return(false) }

    before { expect(character_order).to receive(:escrow).and_return(45.6) }

    subject { character_order.as_json }

    its([:order_id]) { should eq(123) }

    its([:type_id]) { should eq(456) }

    its([:region_id]) { should eq(123) }

    its([:location_id]) { should eq(456) }

    its([:range]) { should eq('station') }

    its([:is_buy_order]) { should eq(true) }

    its([:price]) { should eq(33.3) }

    its([:volume_total]) { should eq(123456) }

    its([:volume_remain]) { should eq(4422) }

    its([:issued]) { should eq(issued) }

    its([:state]) { should eq('open') }

    its([:min_volume]) { should eq(1) }

    its([:account_id]) { should eq(1000) }

    its([:duration]) { should eq(30) }

    its([:is_corp]) { should eq(false) }

    its([:escrow]) { should eq(45.6) }
  end

  describe '#order_id' do
    before { expect(options).to receive(:[]).with('order_id') }

    specify { expect { subject.order_id }.not_to raise_error }
  end

  describe '#type_id' do
    before { expect(options).to receive(:[]).with('type_id') }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#region_id' do
    before { expect(options).to receive(:[]).with('region_id') }

    specify { expect { subject.region_id }.not_to raise_error }
  end

  describe '#location_id' do
    before { expect(options).to receive(:[]).with('location_id') }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#range' do
    before { expect(options).to receive(:[]).with('range') }

    specify { expect { subject.range }.not_to raise_error }
  end

  describe '#is_buy_order' do
    before { expect(options).to receive(:[]).with('is_buy_order') }

    specify { expect { subject.is_buy_order }.not_to raise_error }
  end

  describe '#price' do
    before { expect(options).to receive(:[]).with('price') }

    specify { expect { subject.price }.not_to raise_error }
  end

  describe '#volume_total' do
    before { expect(options).to receive(:[]).with('volume_total') }

    specify { expect { subject.volume_total }.not_to raise_error }
  end

  describe '#volume_remain' do
    before { expect(options).to receive(:[]).with('volume_remain') }

    specify { expect { subject.volume_remain }.not_to raise_error }
  end

  describe '#issued' do
    context 'issued is present' do
      let(:issued) { double }

      before { expect(options).to receive(:[]).with('issued').and_return(issued) }

      before do
        #
        # subject.parse_datetime_with_timezone(issued)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(issued)
      end

      specify { expect { subject.issued }.not_to raise_error }
    end

    context 'issued not present' do
      before { expect(options).to receive(:[]).with('issued').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.issued }.not_to raise_error }
    end
  end

  describe '#state' do
    before { expect(options).to receive(:[]).with('state') }

    specify { expect { subject.state }.not_to raise_error }
  end

  describe '#min_volume' do
    before { expect(options).to receive(:[]).with('min_volume') }

    specify { expect { subject.min_volume }.not_to raise_error }
  end

  describe '#account_id' do
    before { expect(options).to receive(:[]).with('account_id') }

    specify { expect { subject.account_id }.not_to raise_error }
  end

  describe '#duration' do
    before { expect(options).to receive(:[]).with('duration') }

    specify { expect { subject.duration }.not_to raise_error }
  end

  describe '#is_corp' do
    before { expect(options).to receive(:[]).with('is_corp') }

    specify { expect { subject.is_corp }.not_to raise_error }
  end

  describe '#escrow' do
    before { expect(options).to receive(:[]).with('escrow') }

    specify { expect { subject.escrow }.not_to raise_error }
  end
end
