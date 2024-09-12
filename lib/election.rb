class Election
  attr_reader :year,
              :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
    @races
  end

  def candidates
    @races.map { |race| race.candidates }.flatten
  end

  def vote_counts
    vote_count = {}
    candidates.each do |candidate|
      vote_count[candidate.name] = candidate.votes
    end
    vote_count
  end

  def winners
    @races.map(&:winner).compact.reject { |winner| winner == false || winner.nil? }
  end
end
