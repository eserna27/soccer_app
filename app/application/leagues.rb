require_relative 'leagues/league'

module Leagues
  def self.create(params)
    League.new_league(params)
  end
end
