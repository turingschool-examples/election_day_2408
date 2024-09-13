class Election
  attr_reader :year, :races, :candidates

  def initialize(year)
    @year = year
    @races = []
    @candidates = []
  end

  def add_race(office)
    @races << Race.new(office)
    return @races
  end

  def add_candidate_to_election(candidate_info)
    candidate = Candidate.new(candidate_info)
    @candidates << candidate
  end

  def candiate_name(candidates)
    candidates.map do |candiate|
      candidate.name
    end
  end


end
