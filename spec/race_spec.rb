require './spec/spec_helper'

RSpec.describe "Race" do
  before(:each) do
    @race = Race.new("Texas Governor")
  end 

  describe "#exists" do
    it 'exists' do
      expect(@race).to be_an_instance_of(Race)
    end
  end

  describe "#gives the race" do 
    it 'can tell the race' do
      expect(@race.office).to eq("Texas Governor")
    end
  end

    it "candidates start off an empty array" do
      expect(@race.candidates).to eq([])
    end

  describe '#Add candidates to the array' do
    before(:each) do
    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    end

    it 'candidates are an instance from the Candidate class' do
      expect(@candidate1.class).to eq(Candidate)
    end

    it 'candidate has a name' do
      expect(@candidate1.name).to eq("Diana D")
    end

    it 'can update the candidates array' do
      expect(@race.candidates).to eq([@candidate1, @candidate2])
    end
  end
end