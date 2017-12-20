require 'spec_helper'

describe EveOnline::ESI::CharacterSkills do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v4/characters/%<character_id>s/skills/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#as_json' do
    let(:skills) { described_class.new(options) }

    let(:total_sp) { double }

    let(:unallocated_sp) { double }

    before { expect(skills).to receive(:total_sp).and_return(total_sp) }

    before { expect(skills).to receive(:unallocated_sp).and_return(unallocated_sp) }

    subject { skills.as_json }

    its([:total_sp]) { should eq(total_sp) }

    its([:unallocated_sp]) { should eq(unallocated_sp) }
  end

  describe '#total_sp' do
    before do
      #
      # subject.response['total_sp']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('total_sp')
        end
      end
    end

    specify { expect { subject.total_sp }.not_to raise_error }
  end

  describe '#unallocated_sp' do
    before do
      #
      # subject.response['unallocated_sp']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('unallocated_sp')
        end
      end
    end

    specify { expect { subject.unallocated_sp }.not_to raise_error }
  end

  describe '#skills' do
    let(:skill) { double }

    let(:response) do
      [
        {
          'skill_id' => 22_536,
          'skillpoints_in_skill' => 500,
          'trained_skill_level' => 1,
          'active_skill_level' => 0
        }
      ]
    end

    before do
      #
      # subject.response.fetch('skills') # => [{"skill_id"=>22536, "skillpoints_in_skill"=>500, "trained_skill_level"=>1, "active_skill_level"=>0}]
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('skills').and_return(response)
        end
      end
    end

    before do
      #
      # EveOnline::ESI::Models::Skill.new(response.first) # => skill
      #
      expect(EveOnline::ESI::Models::Skill).to receive(:new).with(response.first).and_return(skill)
    end

    specify { expect(subject.skills).to eq([skill]) }

    specify { expect { subject.skills }.to change { subject.instance_variable_defined?(:@_memoized_skills) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-skills.read_skills.v1') }
  end

  describe '#url' do
    specify { expect(subject.url).to eq('https://esi.tech.ccp.is/v4/characters/12345678/skills/?datasource=tranquility') }
  end
end
