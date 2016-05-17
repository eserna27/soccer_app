require_relative 'matches/match'

module Matches
  def self.create_match(params)
    Match.new_match(params)
  end

  def self.save_match(match, match_store)
    match_store.save_match(match)
  end

  def self.all_matches(match_store)
    match_store.all_matches
  end
end
