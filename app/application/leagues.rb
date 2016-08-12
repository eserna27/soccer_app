require_relative 'leagues/league'

module Leagues
  def self.create(params)
    League.new_league(params)
  end

  def self.save(league, league_store)
    league_store.save_league(league)
  end
end
