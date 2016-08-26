module Matches
  class MatchStore
    def self.save_match(match)
      ::Match.create(match.params)
    end

    def self.find_match(match_id)
      ::Match.find(match_id)
    end
  end
end
