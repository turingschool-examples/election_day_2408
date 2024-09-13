class Candidate
    attr_reader :name,
                :party,
                :votes
    def initialize(details)
        @name  = details[:name]
        @party = details[:party]
        @votes = 0
    end

    def votes_for!
        @votes += 1
        return @votes
    end
end
