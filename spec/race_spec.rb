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
end