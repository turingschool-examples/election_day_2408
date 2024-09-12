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

    describe '#open? and #close!' do
        it 'can begin with open as true' do
            expect(@race.open?).to eq(true)
        end

        it 'can close' do
            @race.close!
            expect(@race.open?).to eq(false)
        end
    end
    describe '#winner and #tie?' do
        it "can't give a winner until the race is closed" do
            expect(@race.winner).to eq(false)

        end
        it 'can declare a winner' do
            @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
            @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
            @candidate1.vote_for!
            @candidate1.vote_for!
            @race.close!
            expect(@race.winner).to eq(@candidate1)
        end

        it 'can handle a tie' do
            @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
            @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
            @candidate1.vote_for!
            @candidate2.vote_for!
            @race.close!
            
            expect(@race.winner).to eq(@candidate2)
        end

        it 'can confirm if there is a tie-false' do
            @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
            @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
            @candidate1.vote_for!
            @candidate1.vote_for!
            @race.close!
            expect(@race.tie?).to eq(false)
        end

        it 'can confirm if there is a tie-true' do
            @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
            @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
            @candidate1.vote_for!
            @candidate2.vote_for!
            @race.close!
            expect(@race.tie?).to eq(true)
        end
    end
end