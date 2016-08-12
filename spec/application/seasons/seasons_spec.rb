require 'spec_helper'
require_relative '../../../app/application/teams'
require_relative '../../../app/application/seasons'
require_relative '../../../app/application/leagues'
require_relative 'season_store_fake'

describe "Season create" do
  it "should have some parmas" do
    parmas = {
      name: "Apertura 2016",
      year: "2016",
      league: Leagues.create({ namel: "Liga BBVA Bancomer",location: "MX" })
    }
    season = Seasons.create(parmas)
    expect(season.name).to eq "Apertura 2016"
    expect(season.year).to eq "2016"
    expect(season.league.location).to eq "MX"
  end

  it "should save" do
    parmas = {
      name: "Apertura 2016",
      year: "2016",
      league: Leagues.create({ namel: "Liga BBVA Bancomer",location: "MX" })
    }
    season = Seasons.create(parmas)
    expect(Seasons.save_season(season, SeasonStoreFake)).to eq true
  end
end
