require './spec/spec_helper'

RSpec.describe "Race" do
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
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


end