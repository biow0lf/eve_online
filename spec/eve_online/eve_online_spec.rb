require 'spec_helper'

describe EveOnline::EveOnline do
  specify { expect(described_class).to be_a(Memoist) }

  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }
  end

  describe '#account_status' do
    before do
      #
      # EveOnline::Account::Status.new(key_id, v_code)
      #
      expect(EveOnline::Account::Status).to receive(:new).with(key_id, v_code)
    end

    specify { expect { subject.account_status }.not_to raise_error }

    specify { expect { subject.account_status }.to change { subject.instance_variable_defined?(:@_memoized_account_status) }.from(false).to(true) }
  end

  describe '#characters' do
    before do
      #
      # EveOnline::Account::Characters.new(key_id, v_code).characters
      #
      expect(EveOnline::Account::Characters).to receive(:new).with(key_id, v_code) do
        double.tap do |a|
          expect(a).to receive(:characters)
        end
      end
    end

    specify { expect { subject.characters }.not_to raise_error }

    specify { expect { subject.characters }.to change { subject.instance_variable_defined?(:@_memoized_characters) }.from(false).to(true) }
  end
end
