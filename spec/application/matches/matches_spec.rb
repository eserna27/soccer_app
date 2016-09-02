require 'spec_helper'
require_relative '../../../app/application/matches'
require_relative '../../../app/application/seasons'
require_relative '../../../app/application/weeks'
require_relative '../teams/teams_fake'
require_relative '../teams/team_store_fake'
require_relative 'match_store_fake'

describe "Match create" do
  it "should recive" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    date_time = Time.local(2016, 07, 27, 12, 00, 00, "+06:00")
    parmas = {
      name: "Apertura 2016",
      year: "2016"
    }
    season = Seasons.create(parmas)
    week = Weeks.create_week({
      season: season,
      week_number: 1
    })
    params = { home_team: home_team, away_team: away_team, date: date_time, week: week }
    match = Matches.create_match(params)
    expect(match.home_team.name).to eq "Local"
    expect(match.away_team.name).to eq "Visitante"
    expect(match.date.to_s).to eq "2016-07-27 12:00:00 -0500"
    expect(match.week.week_number).to eq 1
  end
end

describe "Match validation" do
  it "should has both teams" do
    away_team = TeamsFake.new_team_with_name("Visitante")
    date_time = Time.local(2016, 07, 27, 12, 00, 00, "+06:00")
    parmas = {
      name: "Apertura 2016",
      year: "2016"
    }
    season = Seasons.create(parmas)
    week = Weeks.create_week({
      season: season,
      week_number: 1
    })
    params = { home_team: "", away_team: away_team, date: date_time, week: week }
    match = Matches.create_match(params)
    match.validate
    expect(match.errors[:error]).to eq ["miss_team"]
  end

  it "should not be the same team" do
    home_team = TeamsFake.new_team_with_name("Local")
    date_time = Time.local(2016, 07, 27, 12, 00, 00, "+06:00")
    params = { home_team: home_team, away_team: home_team, date: date_time }
    match = Matches.create_match(params)
    match.validate
    expect(match.errors[:error]).to eq ["same_team"]
  end

  it "should has date" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    params = { home_team: home_team, away_team: away_team }
    match = Matches.create_match(params)
    match.validate
    expect(match.errors[:error]).to eq ["need_date"]
  end
end

describe "Save Mach" do
  it "should recive a match and save" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    date_time = Time.local(2016, 07, 27, 12, 00, 00, "+06:00")
    parmas = {
      name: "Apertura 2016",
      year: "2016"
    }
    season = Seasons.create(parmas)
    week = Weeks.create_week({
      season: season,
      week_number: 1
    })
    params = { home_team: "", away_team: away_team, date: date_time, week: week  }
    match = Matches.create_match(params)
    match_save = Matches.save_match(match, MatchStoreFake)
    expect(match_save).to eq true
  end
end

describe "List all Match" do
  it "should get the list of games" do
    matches = Matches.all_matches(MatchStoreFake, TeamStoreFake)
    expect(matches.count).to eq 2
    expect(matches[0].home_team.name).to eq "Rayados"
  end
end
