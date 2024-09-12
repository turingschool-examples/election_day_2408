require './spec/spec_helper'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Govenor")
    @candidate1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate2 = Candidate.new({name: "Roberto R", party: :republican})
  end

  it 'is a race' do
    expect(@race).to be_an_instance_of(Race)
  end

  it 'knows what position it is for' do
    expect(@race.office).to eq("Texas Govenor")
  end

  it 'has no candidates yet' do
    expect(@race.candidates).to eq([])
  end

  it 'can add candidates' do
    @race.register_candidate!(@candidate1)
    expect(@candidate1).to be_an_instance_of(Candidate)
    expect(@candidate1.name).to eq("Diana D")
    expect(@candidate1.party).to eq(:democrat)
    @race.register_candidate!(@candidate2)
    expect(@race.candidates.length).to eq(2)
  end

  it 'has races default to open' do
    expect(@race.open?).to be true
  end

  it 'can close the race' do
    @race.close!
    expect(@race.open?).to be false
  end

  it 'will not declare a winner if a race is open' do
    expect(@race.winner).to be false
  end

  it 'needs a candidate to delcare a winner' do
    @race.close!
    expect(@race.winner).to be(nil)
  end

  it 'declares a winner if the race is closed' do
    @race.register_candidate!(@candidate1)
    @race.register_candidate!(@candidate2)
    @candidate1.vote_for!
    @candidate1.vote_for!
    @candidate2.vote_for!
    @race.close!
    expect(@race.winner).to eq(@candidate1)
  end

  describe '#tie' do
    it 'returns true if tied' do
      @race.register_candidate!(@candidate1)
      @race.register_candidate!(@candidate2)
      @candidate1.vote_for!    
      @candidate2.vote_for!
      @race.close!
      expect(@race.tie?).to be true
    end

    it 'returns false if not tied' do
      @race.register_candidate!(@candidate1)
      @race.register_candidate!(@candidate2)
      @candidate1.vote_for!
      @candidate1.vote_for!    
      @candidate2.vote_for!
      @race.close!
      expect(@race.tie?).to be false
    end
  end
end