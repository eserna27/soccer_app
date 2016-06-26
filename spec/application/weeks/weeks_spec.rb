require 'spec_helper'
require_relative '../../../app/application/teams'
require_relative '../../../app/application/seasons'
require_relative '../../../app/application/weeks'
require_relative '../../../app/application/matches'
require_relative '../teams/team_store_fake'

describe "Weeks create" do
  it "should have params" do
    parmas = {
      name: "Apertura 2016",
      year: "2016",
      teams: [Teams.create({ name: "Rayados", twitter: "@Rayados", hashtags: "#Rayados" }),
              Teams.create({ name: "Tigres", twitter: "@Tigres", hashtags: "#Tigres" })]
    }
    season = Seasons.create(parmas)
    week = Weeks.create_week({
      season: season,
      week_number: 1
    })
    expect(week.season.name).to eq "Apertura 2016"
    expect(week.week_number).to eq 1
  end
end

describe "Week add match" do
  it "should recive match and week of season" do
    home_team = TeamsFake.new_team_with_name("Local")
    away_team = TeamsFake.new_team_with_name("Visitante")
    date_time = Time.local(2016, 07, 27, 12, 00, 00, "+06:00")
    match = Matches.
      create_match(
        { home_team: home_team, away_team: away_team, date: date_time })
    parmas = {
      name: "Apertura 2016",
      year: "2016",
      teams: [Teams.create({ name: "Rayados", twitter: "@Rayados", hashtags: "#Rayados" }),
              Teams.create({ name: "Tigres", twitter: "@Tigres", hashtags: "#Tigres" })]
    }
    season = Seasons.create(parmas)
    week = Weeks.create_week({
      season: season,
      week_number: 1
    })
    week.add_match(match)
    expect(week.matches.length).to eq 1
  end
end
