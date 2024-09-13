require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe '#election' do
    before(:each) do

        @election = Election.new("2024")
        @race1 = Race.new("Texas Governor")
        @race2 = Race.new("Senate")
        @candidate1 = @race1.register_candidate!({name: "Diana D", party: :democrat})
        @candidate2 = @race1.register_candidate!({name: "Roberto R", party: :republican})
        @candidate3 = @race2.register_candidate!({name: "Niko Brendell", party: :german})
    end

    it 'can initialize' do

        expect(@election).to be_an_instance_of(Election)
    end

    it 'can give the election year' do

        expect(@election.year).to eq("2024")
    end

    it 'can give the election race' do
        @election.add_race(@race1)

        expect(@election.races).to include(@race1)
    end

    it 'can add a race' do
        @election.add_race(@race1)
        @election.add_race(@race2)

        expect(@election.races).to include(@race1, @race2)
    end

    it 'can list out all candidates as an array' do

        expect(@election.all_candidates).to be_an(Array)
      end

      it 'can count candidate votes' do
        @election.add_race(@race1)
        @election.add_race(@race2)

        @candidate1.vote_for!
        @candidate1.vote_for!
        @candidate1.vote_for!
        @candidate2.vote_for!
        @candidate3.vote_for!
        @candidate3.vote_for!
        @candidate3.vote_for!

        expect(@election.vote_count).to eq({
            "Diana D" => 3,
            "Roberto R" => 1,
            "Niko Brendell" => 3
            })
    end
end