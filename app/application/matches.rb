require_relative 'matches/match'

module Matches
  def self.create_match(params)
    Match.new_match(params)
  end

  def self.create_from_form(params)
    Match.create_from_form(params)
  end

  def self.save_match(match, match_store)
    match_store.save_match(match)
  end

  def self.all_matches(match_store, team_store)
    Match.list_matches(match_store.all_matches, team_store)
  end

  def self.find_match(match_id, match_store, team_store)
    Matches::Match.new_match_from_store(Matches::MatchStore.find_match(match_id), team_store)
  end

  def self.new_for_form(week)
    Matches::Match.new_for_form(week)
  end
end
