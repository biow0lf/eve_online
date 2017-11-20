require 'spec_helper'

describe EveOnline::XML::CorporationMarketOrders do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::XML::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/corp/MarketOrders.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(4_096) }

  describe '#initialize' do
    context 'default' do
      let(:parser) { double }

      before do
        #
        # Nori.new(advanced_typecasting: false) => double
        #
        expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
      end

      its(:parser) { should eq(parser) }

      its(:key_id) { should eq(key_id) }

      its(:v_code) { should eq(v_code) }

      its(:character_id) { should eq(nil) }

      its(:order_id) { should eq(nil) }
    end

    context 'with options' do
      let(:options) do
        {
          character_id: 12_345_678,
          order_id: 123_456_789
        }
      end

      subject { described_class.new(key_id, v_code, options) }

      its(:character_id) { should eq(options[:character_id]) }

      its(:order_id) { should eq(options[:order_id]) }
    end
  end

  describe '#orders' do
    context 'row is Hash' do
      let(:market_order) { double }

      let(:row) do
        {
          '@orderID' => '4053334100',
          '@charID' => '1801683792',
          '@stationID' => '60005686',
          '@volEntered' => '340000',
          '@volRemaining' => '245705',
          '@minVolume' => '1',
          '@orderState' => '0',
          '@typeID' => '24488',
          '@range' => '32767',
          '@accountKey' => '1000',
          '@duration' => '90',
          '@escrow' => '0.00',
          '@price' => '92.00',
          '@bid' => '0',
          '@issued' => '2015-05-19 03:16:16'
        }
      end

      before do
        #
        # subject.row # => {"@orderID"=>"4053334100", "@charID"=>"1801683792", "@stationID"=>"60005686", "@volEntered"=>"340000", "@volRemaining"=>"245705", "@minVolume"=>"1", "@orderState"=>"0", "@typeID"=>"24488", "@range"=>"32767", "@accountKey"=>"1000", "@duration"=>"90", "@escrow"=>"0.00", "@price"=>"92.00", "@bid"=>"0", "@issued"=>"2015-05-19 03:16:16"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::MarketOrder.new(row) # => market_order
        #
        expect(EveOnline::MarketOrder).to receive(:new).with(row).and_return(market_order)
      end

      specify { expect(subject.orders).to eq([market_order]) }

      specify { expect { subject.orders }.to change { subject.instance_variable_defined?(:@_memoized_orders) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:market_order) { double }

      let(:row) do
        [
          {
            '@orderID' => '4053334100',
            '@charID' => '1801683792',
            '@stationID' => '60005686',
            '@volEntered' => '340000',
            '@volRemaining' => '245705',
            '@minVolume' => '1',
            '@orderState' => '0',
            '@typeID' => '24488',
            '@range' => '32767',
            '@accountKey' => '1000',
            '@duration' => '90',
            '@escrow' => '0.00',
            '@price' => '92.00',
            '@bid' => '0',
            '@issued' => '2015-05-19 03:16:16'
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@orderID"=>"4053334100", "@charID"=>"1801683792", "@stationID"=>"60005686", "@volEntered"=>"340000", "@volRemaining"=>"245705", "@minVolume"=>"1", "@orderState"=>"0", "@typeID"=>"24488", "@range"=>"32767", "@accountKey"=>"1000", "@duration"=>"90", "@escrow"=>"0.00", "@price"=>"92.00", "@bid"=>"0", "@issued"=>"2015-05-19 03:16:16"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::MarketOrder.new(row.first) # => market_order
        #
        expect(EveOnline::MarketOrder).to receive(:new).with(row.first).and_return(market_order)
      end

      specify { expect(subject.orders).to eq([market_order]) }

      specify { expect { subject.orders }.to change { subject.instance_variable_defined?(:@_memoized_orders) }.from(false).to(true) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.orders }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    context 'default' do
      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
      end
    end

    context 'with character_id' do
      let(:options) { { character_id: 12_345_678 } }

      subject { described_class.new(key_id, v_code, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ options[:character_id] }")
      end
    end

    context 'with order_id' do
      let(:options) { { order_id: 123_456_789 } }

      subject { described_class.new(key_id, v_code, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&orderID=#{ options[:order_id] }")
      end
    end

    context 'with character_id and order_id' do
      let(:options) do
        {
          character_id: 12_345_678,
          order_id: 123_456_789
        }
      end

      subject { described_class.new(key_id, v_code, options) }

      specify do
        expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ options[:character_id] }&orderID=#{ options[:order_id] }")
      end
    end
  end

  # private methods

  describe '#rowset' do
    before do
      #
      # subject.result.fetch('rowset')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end

  describe '#row' do
    before do
      #
      # subject.rowset.fetch('row')
      #
      expect(subject).to receive(:rowset) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:row) }.not_to raise_error }

    specify { expect { subject.send(:row) }.to change { subject.instance_variable_defined?(:@_memoized_row) }.from(false).to(true) }
  end
end
