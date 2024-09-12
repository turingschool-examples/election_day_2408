require './spec/spec_helper'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("1884")
    @race1 = Race.new("Colorado Govenor")
    @race2 = Race.new("District 4 Senator")
    @candidate1 = Candidate.new({name: "Shirley May", party: :green})
    @candidate2 = Candidate.new({name: "Louise Pearlman", party: :independant})
    @candidate3 = Candidate.new({name: "Timmy Topple", party: :republican})
    @candidate4 = Candidate.new({name: "Gretchen Farler", party: :democrat})
    @candidate5 = Candidate.new({name: "Gordan Heavyfoot", party: :whigs})
  end
  
  it 'is an election' do
    expect(@election).to be_an_instance_of(Election)
    expect(@election.year).to eq("1884")
  end

  it 'starts without races then adds races' do
    expect(@election.races).to eq([])
    @election.add_race(@race1)
    expect(@election.races).to eq([@race1])
    @election.add_race(@race2)
    expect(@election.races).to eq([@race1, @race2])
  end

  it 'registers candidates for races' do
    @race1.register_candidate!(@candidate1)
    @race1.register_candidate!(@candidate5)
    @race2.register_candidate!(@candidate2)
    @race2.register_candidate!(@candidate3)
    @race2.register_candidate!(@candidate4)
    @election.add_race(@race1)
    @election.add_race(@race2)
    expect(@election.candidates).to eq([@candidate1, @candidate5, @candidate2, @candidate3, @candidate4])
  end

  it 'returns a hash with key as candidate name and vote count as value' do
    @race1.register_candidate!(@candidate1)
    @race1.register_candidate!(@candidate5)
    @race2.register_candidate!(@candidate2)
    @race2.register_candidate!(@candidate3)
    @race2.register_candidate!(@candidate4)
    @election.add_race(@race1)
    @election.add_race(@race2)
    5.times { @candidate1.vote_for! }
    9.times { @candidate5.vote_for!}
    @candidate3.vote_for!
    3.times { @candidate2.vote_for! }
    6.times { @candidate4.vote_for!}

    vote_count = {
      "Shirley May" => 5,
      "Gordan Heavyfoot" => 9,
      "Timmy Topple" => 1,
      "Louise Pearlman" => 3,
      "Gretchen Farler" => 6
    }
    expect(@election.vote_counts).to eq(vote_count)
  end
end
