require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
    
    it' exists' do 
    election = Election.new('2024')
    expect(election).to be_an_instance_of(Election)
    expect(election.year).to eq('2024')
    end

    it 'starts with an empty list of races' do
    election = Election.new("2024")
    expect(election.races).to eq([])
  end

  it 'can add races to the list' do
    election = Election.new("2024")
    race = Race.new("Texas Governor")

    election.add_race(race)

    expect(election.races).to include(race)
  end
    
  it 'can show all candidates' do
    election = Election.new("2024")
    race1 = Race.new("Texas Governor")
    race2 = Race.new("Florida Senator")
    
    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
    candidate3 = race2.register_candidate!({name: "Jane J", party: :independent})

    election.add_race(race1)
    election.add_race(race2)

    expect(election.candidates).to include(candidate1, candidate2, candidate3)
    expect(election.candidates.count).to eq(3)
  end

  it 'can count votes' do
    race1 = Race.new("Texas Governor")
    race2 = Race.new("Florida Senator")

    candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
    candidate3 = race2.register_candidate!({name: "Jane J", party: :independent})

    candidate1.votes_for! 
    candidate1.votes_for! 
    candidate2.votes_for! 

    election = Election.new("2024")
    election.add_race(race1)
    election.add_race(race2)

    expected_vote_counts = {
        "Diana D" => 2,
        "Roberto R" => 1,
        "Jane J" => 0
    }

    expect(election.vote_counts).to eq(expected_vote_counts)
  end
end
