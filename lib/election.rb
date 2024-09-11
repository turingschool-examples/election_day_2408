class Election
    attr_reader :year,
                :races

    def initialize(year)
        @year = year
        @races = []
    end

    def add_race(race)
        @races << race
    end

    def candidates
        candidate_list =[]
        @races.each do |race|
            race.candidates.each do |candidate|
                candidate_list << candidate
            end
        end
        candidate_list
    end

    def vote_counts
        vote_hash = {}
        @races.each do |race|
            race.candidates.each do |candidate|
                vote_hash[candidate] = candidate.votes
            end
        end
        vote_hash
    end
end
