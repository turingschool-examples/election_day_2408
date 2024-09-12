require './spec/spec_helper'

RSpec.describe Candidate do
  before(:each) do
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end
  
  it 'exists' do
    expect(@diana).to be_an_instance_of(Candidate)
  end

  it 'has characteristics' do
    expect(@diana.name).to eq("Diana D")
    expect(@diana.party).to eq(:democrat)
    expect(@diana.votes).to eq (0)
  end

  it 'can recieve votes' do
    3.times { @diana.vote_for! }
    expect(@diana.votes).to eq(3)
    @diana.vote_for!
    expect(@diana.votes).to eq(4)
  end
end