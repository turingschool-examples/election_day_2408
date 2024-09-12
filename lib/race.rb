require './lib/candidate'

class Race
  include Candidate
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(candidates)
    
  end
end
