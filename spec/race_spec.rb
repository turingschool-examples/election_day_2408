require 'pry'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
    it 'exists' do
        race = Race.new("Texas Governor")
        
        expect(race).to be_an_instance_of(Race)
    end

    it 'can register and record candidates' do
        race = Race.new("Texas Governor")

        candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})

        expect(candidate1).to be_an_instance_of(Candidate)
        expect(candidate1.name).to eq("Diana D")
        expect(candidate1.party).to eq(:democrat)

        candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
        
        expect(race.candidates).to include(candidate1,candidate2)        
    end
end