require 'spec_helper'
require_relative '../../../app/application/teams'
require_relative '../../../app/application/seasons'

describe "Season create" do
  it "should have some parmas" do
    parmas = {
      name: "Apertura 2016",
      year: "2016",
      teams: [Teams.create({ name: "Rayados", twitter: "@Rayados", hashtags: "#Rayados" }),
              Teams.create({ name: "Tigres", twitter: "@Tigres", hashtags: "#Tigres" })]
    }
    season = Seasons.create(parmas)
    expect(season.name).to eq "Apertura 2016"
    expect(season.year).to eq "2016"
    expect(season.teams.length).to eq 2
  end
end
