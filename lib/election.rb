class Election

    attr_reader :year, :races, :vote_counts

    def initialize(year)
        @year = year
        @races = []
    end

    def add_race(race)
        @races << race
        race
    end

    def all_candidates
        candidates = []
        @races.each do |race|
        candidates.concat(race.candidates)
        end
        candidates
    end

    def vote_count
        counts = {}
        all_candidates.each do |candidate|
          counts[candidate.name] = candidate.votes
        end
        counts
      end
    end

