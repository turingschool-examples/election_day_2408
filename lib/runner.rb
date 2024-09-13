require './spec/spec_helper'

candidate1 = Candidate.new({name: "Diana D", party: :democrat})
candidate2 = Candidate.new({name: "Roberto R", party: :republican})


race = Race.new("Texas Governor")

print race.candidates