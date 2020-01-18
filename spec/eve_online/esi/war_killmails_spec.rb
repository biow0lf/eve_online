# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::WarKillmails do
  let(:options) { {war_id: 615_578} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/wars/%<war_id>s/killmails/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq(nil) }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
        its(:_write_timeout) { should eq(60) }
      end

      its(:war_id) { should eq(615_578) }

      its(:page) { should eq(1) }
    end

    context "with options" do
      let(:options) { {war_id: 615_578, page: 10} }

      its(:page) { should eq(10) }
    end
  end

  describe "#killmails" do
    context "when @killmails set" do
      let(:killmails) { [instance_double(EveOnline::ESI::Models::KillmailShort)] }

      before { subject.instance_variable_set(:@killmails, killmails) }

      specify { expect(subject.killmails).to eq(killmails) }
    end

    context "when @killmails not set" do
      let(:killmail) { instance_double(EveOnline::ESI::Models::KillmailShort) }

      let(:response) do
        [
          {
            killmail_hash: "07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5",
            killmail_id: 72_410_059,
          },
        ]
      end

      before do
        #
        # subject.response # => [{"killmail_hash"=>716338097, "killmail_id"=>72410059}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::KillmailShort.new(response.first) # => killmail
        #
        expect(EveOnline::ESI::Models::KillmailShort).to receive(:new).with(response.first).and_return(killmail)
      end

      specify { expect(subject.killmails).to eq([killmail]) }

      specify { expect { subject.killmails }.to change { subject.instance_variable_get(:@killmails) }.from(nil).to([killmail]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:page]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/wars/615578/killmails/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(page: 1)
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/wars/615578/killmails/?page=1")
    end
  end
end
