class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(office)
    @races << Race.new(office)
    return @races
  end

  # def vote_counts
  #   race.candidates.each do |candidate|
  #     candidate.each do |name, party|

end
