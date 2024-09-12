module Candidate
  attr_reader :name, :party, :votes

  def initialize(candidate_info)
    @name = candidate_info[:name]
    @party = candidate_info[:party]
    @votes = 0
  end

  def vote_for!
    @votes += 1
  end

  def self.create_multiple(candidates)
    candidates.map do |candidate|
      Candidate.new(candidate[candidate_info])
    end
  end
end

candidates = [
  {name: "Diana D", party: :democrat}, 
  {name: "Roberto R", party: :republican}
]

Candidate.create_multiple(candidates)
