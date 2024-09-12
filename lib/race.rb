class Race
    attr_reader :office,
                :candidates,
                :polls_open

    def initialize(office)
        @office = office
        @candidates = []
        @polls_open = true
    end

    def register_candidate!(candidate_info)
        @candidates << new_candidate=Candidate.new(candidate_info)
        new_candidate
    end

    def open?
        @polls_open
    end

    def close!
        @polls_open = false
    end

    def winner
        if @polls_open ==true
            false
        else
            vote_sorter[0]
        end
    end

    def tie?
        vote_sorter[0].votes == vote_sorter[1].votes
    end

    def vote_sorter
        vote_sorter=candidates.sort_by do |candidate|
            candidate.votes
        end
    vote_sorter.reverse
    end


end
