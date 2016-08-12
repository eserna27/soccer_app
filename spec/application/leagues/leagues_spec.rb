require 'spec_helper'
require_relative '../../../app/application/leagues'
require_relative 'league_store_fake'

describe "League create" do
  it "should have params" do
    params = {
      name: "Liga BBVA Bancomer",
      location: "México"
    }
    league = Leagues.create(params)
    expect(league.name).to eq "Liga BBVA Bancomer"
    expect(league.location).to eq "México"
  end

  it "should save" do
    params = {
      name: "Liga BBVA Bancomer",
      location: "México"
    }
    league = Leagues.create(params)
    expect(Leagues.save(league, LeagueStoreFake)).to eq true
  end
end
