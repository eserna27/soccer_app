require 'spec_helper'
require_relative '../../../app/application/teams'
require_relative 'team_store_fake'

describe "Teams can be create" do
  it "should recive params" do
    params = { name: "Rayados", twitter: "@Rayados", hashtags: "#Rayados",
      logo: "rayados.jpg" }
    team = Teams.create(params)
    expect(team.name).to eq "Rayados"
    expect(team.twitter).to eq "@Rayados"
    expect(team.hashtags).to eq "#Rayados"
    expect(team.logo).to eq "rayados.jpg"
  end

  it "should has name twitter and hashtags" do
    params = { name: "", twitter: "", hashtags: "" }
    team = Teams.create(params)
    team.validates_params
    expect(team.errors).to eq ["name_necessary", "twitter_necessary"]
  end

  it "should recive true if save" do
    params = { name: "Rayados", twitter: "@Rayados", hashtags: "#Rayados",
      logo: "rayados.jpg" }
    team = Teams.create(params)
    team_save = Teams.save(team, TeamStoreFake)
    expect(team_save).to eq true
  end
end

describe "Teams can be show" do
  it "should get all the attributes" do
    team = Teams.view_team("-team-id-", TeamStoreFake)
    expect(team.name).to eq "Rayados"
    expect(team.twitter).to eq "@Rayados"
    expect(team.hashtags).to eq "#Rayados"
    expect(team.logo).to eq "rayados.jpg"
  end
end

describe "Teams All" do
  it "should get all teams" do
    teams = Teams.all_teams(TeamStoreFake)
    expect(teams.count).to eq 2
  end
end
