require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
    before(:each) do
        @election = Election.new("2024")
        @race = Race.new("Texas Governor")
        @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
        @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    end

    describe '#election' do
        it 'can initialize' do
            expect(@election.class).to eq(Election)
            expect(@election.year).to eq("2024")
            expect(@election.races).to eq([])
        end
    end
    describe '#add_race' do
        it 'can add races to the election' do
           @election.add_race(@race)
           expect(@election.races).to eq([@race])
        end
    end
    describe '#candidates' do
        it 'can provide candidate info' do
            @election.add_race(@race)
            expect(@election.candidates).to eq([@candidate1, @candidate2])
        end
    end

    describe '#vote_counts' do
        it 'can provide votes by candidate' do
            @election.add_race(@race)
            result_hash = {
                @candidate1 => @candidate1.votes,
                @candidate2 => @candidate2.votes
            }
            expect(@election.vote_counts). to eq(result_hash)
        end
    end

    describe '#winners' do
        it 'can provide a list of winners for a closed race' do
            @candidate1.vote_for!
            @candidate1.vote_for!
            @race.close!

            @race2 = Race.new("Colorado Governor")
            @candidate3 = @race.register_candidate!({name: "Matt T", party: :democrat})
            @candidate4 = @race.register_candidate!({name: "John L", party: :republican})
            expect(@election.winners).to eq([@candidate1])

            @candidate4.vote_for!
            @race2.close!
            expect(@election.winners).to eq([@candidate1,@candidate4])
        end

        it 'does not list a tie' do
            @candidate1.vote_for!
            @candidate1.vote_for!
            @race.close!

            @race2 = Race.new("Colorado Governor")
            @candidate3 = @race.register_candidate!({name: "Matt T", party: :democrat})
            @candidate4 = @race.register_candidate!({name: "John L", party: :republican})
            @candidate4.vote_for!
            @candidate3.vote_for!
            @race2.close!
            expect(@election.winners).to eq([@candidate1])
        end

    end

end