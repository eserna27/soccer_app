require 'spec_helper'
require_relative '../../../app/application/leagues'

describe "League create" do
  it "should have params" do
    params = {
      name: "Liga BBVA Bancomer",
      location: "México",
    }
    league = Leagues.create(params)
    expect(league.name).to eq "Liga BBVA Bancomer"
    expect(league.location).to eq "México"
  end
end
