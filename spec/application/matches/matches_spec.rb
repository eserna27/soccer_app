require 'spec_helper'
require_relative '../../../app/application/matches'
require_relative '../teams/teams_fake'
require_relative 'match_store_fake'

describe "Match create" do
  it "should recive" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    params = { home_team: home_team, away_team: away_team }
    match = Matches.create_match(params)
    expect(match.home_team.name).to eq "Local"
    expect(match.away_team.name).to eq "Visitante"
  end
end

describe "Match validation" do
  it "should validate the inputs" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    params = { home_team: "", away_team: away_team }
    match = Matches.create_match(params)
    match.validate
    expect(match.errors).to eq ["miss_team"]
  end
end

describe "Save Mach" do
  it "should recive a match and save" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    params = { home_team: "", away_team: away_team }
    match = Matches.create_match(params)
    match_save = Matches.save_match(match, MatchStoreFake)
    expect(match_save).to eq true
  end
end

describe "List all Match" do
  it "should get the list of games" do
    matches = Matches.all_matches(MatchStoreFake)
    expect(matches.count).to eq 2
  end
end
