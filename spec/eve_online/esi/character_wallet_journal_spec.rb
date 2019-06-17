# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterWalletJournal do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v6/characters/%<character_id>s/wallet/journal/?datasource=%<datasource>s&page=%<page>s') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq('token123') }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
        its(:_write_timeout) { should eq(60) }
      end

      its(:datasource) { should eq('tranquility') }

      its(:character_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context 'with options' do
      let(:options) { { token: 'token123', character_id: 12_345_678, page: 10 } }

      its(:page) { should eq(10) }
    end
  end

  describe '#wallet_journal_entries' do
    context 'when @wallet_journal_entries set' do
      let(:wallet_journal_entries) { [instance_double(EveOnline::ESI::Models::WalletJournalEntry)] }

      before { subject.instance_variable_set(:@wallet_journal_entries, wallet_journal_entries) }

      specify { expect(subject.wallet_journal_entries).to eq(wallet_journal_entries) }
    end

    context 'when @wallet_journal_entries not set' do
      let(:wallet_journal_entry) { instance_double(EveOnline::ESI::Models::WalletJournalEntry) }

      let(:response) do
        [
          {
            date: '2018-03-06T12:43:50Z',
            ref_id: 15_264_764_711,
            ref_type: 'market_escrow',
            first_party_id: 90_729_314,
            first_party_type: 'character',
            amount: -9.5,
            balance: 4990.5
          }
        ]
      end

      before do
        #
        # subject.response # => [{"date"=>"2018-03-06T12:43:50Z", "ref_id"=>15264764711, "ref_type"=>"market_escrow", "first_party_id"=>90729314, "first_party_type"=>"character", "amount"=>-9.5, "balance"=>4990.5}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::WalletJournalEntry.new(response.first) # => wallet_journal_entry
        #
        expect(EveOnline::ESI::Models::WalletJournalEntry).to receive(:new).with(response.first).and_return(wallet_journal_entry)
      end

      specify { expect(subject.wallet_journal_entries).to eq([wallet_journal_entry]) }

      specify { expect { subject.wallet_journal_entries }.to change { subject.instance_variable_get(:@wallet_journal_entries) }.from(nil).to([wallet_journal_entry]) }
    end
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-wallet.read_character_wallet.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v6/characters/12345678/wallet/journal/?datasource=tranquility&page=1')
    end
  end
end
