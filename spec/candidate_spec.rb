require 'rspec'
require './lib/candidate'

RSpec.describe Candidate do
    before(:each) do
        @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    it 'exists' do

        expect(@diana).to be_an_instance_of(Candidate)
    end

    it 'has a name' do

        expect(@diana.name).to eq("Diana D")
    end

    it 'is part of a party' do

        expect(@diana.party).to eq(:democrat)
    end

    describe '#voting' do
    it 'can can show the default number of votes' do

        expect(@diana.votes).to eq(0)
    end

    it 'can vote and count votes' do
        @diana.vote_for!
        @diana.vote_for!
        @diana.vote_for!

        expect(@diana.votes).to eq(3)

        @diana.vote_for!

        expect(@diana.votes).to eq(4)
    end
end
end