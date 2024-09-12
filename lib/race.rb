class Race
  attr_reader :office,
              :candidates
              
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate)    
    @candidates << candidate    
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if open?
    return nil if candidates.empty?
    return nil if tie?

    candidates.max_by(&:votes)
  end

  def tie?
    return false if open?
    
    max_votes = candidates.max_by(&:votes).votes
    candidates.count { |candidate| candidate.votes == max_votes } >1
  end
end
