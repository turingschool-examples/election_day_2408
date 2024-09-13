require 'rspec'
require './lib/race'
require './lib/candidate'

RSpec.describe Race do
    before(:each) do

        @race = Race.new("Texas Governor")
        
    end

    it 'exists' do
        
        expect(@race).to be_an_instance_of(Race)
    end

    it 'has an office' do

        expect(@race.office).to eq("Texas Governor")
    end

    it 'starts with an emptry array of candidates' do

        expect(@race.candidates).to eq([])
    end

    it 'can register a candidate' do
        candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

        expect(candidate1.class).to eq(Candidate)
        expect(candidate1.name).to eq("Diana D")
        expect(candidate1.party).to eq(:democrat)
    end

    it 'can create a second candidate in the race' do
        candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
        candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

        expect(@race.candidates).to include(candidate1, candidate2)
    end


end