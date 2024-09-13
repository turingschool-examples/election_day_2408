require 'pry'
require './lib/candidate'

RSpec.describe Candidate do

    it 'exists' do
        diana = Candidate.new({name: "Diana D", party: :democrat})
        expect(diana).to be_an_instance_of(Candidate)
    end

    it 'can count votes' do
        diana = Candidate.new({name: "Diana D", party: :democrat})
        expect(diana.votes).to eq(0)
        
       3.times do diana.votes_for!
       end

       expect(diana.votes).to eq 3

       diana.votes_for!
       
       expect(diana.votes).to eq 4
    end
    
    
end