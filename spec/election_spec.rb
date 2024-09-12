require './spec/spec_helper'

RSpec.describe 'Election' do
  before(:each) do
    @election = Election.new("2024")
  end 

  describe '#exists' do
    it 'exists' do
      expect(@election).to be_an_instance_of(Election)
    end

    it 'can give the year of the election' do
      expect(@election.year).to eq("2024")
    end
  end

  describe '#add race' do
    before(:each) do
      @race = Race.new("Texas Governor")
    end

    it 'can add a race to the races array' do
      @election.add_race("Texas Governor")
      expect(@election.races.length).to eq(1)
      expect(@election.races.first).to be_an_instance_of(Race)
      expect(@election.races.first.office).to eq("Texas Governor")
    end
  end

end