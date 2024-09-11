require 'pry'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
    before(:each) do
        @race = Race.new("Texas Governor")
    end

    describe '#race' do
        it 'can initialize' do
            expect(@race.office).to eq("Texas Governor")
            expect(@race.candidates).to eq([])
        end
    end

    describe '#register_candidate' do
        it'can create candidate' do
            @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
        
            expect(@candidate1.class).to eq(Candidate)
            expect(@candidate1.name).to eq("Diana D")
            expect(@candidate1.party).to eq(:democrat)
        end

        it 'can track multiple candidates' do
            @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
            @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
            expect(@race.candidates).to eq([@candidate1, @candidate2])
        end
    end
end