module Leagues
  class LeagueStore
    def self.save_league(league)
      ::League.create(league.params)
    end
  end
end
