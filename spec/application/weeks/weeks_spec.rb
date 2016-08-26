require 'spec_helper'
require_relative '../../../app/application/teams'
require_relative '../../../app/application/seasons'
require_relative '../../../app/application/weeks'
require_relative '../../../app/application/matches'
require_relative '../teams/team_store_fake'
require_relative '../seasons/season_store_fake'
require_relative 'week_store_fake'

describe "Weeks create" do
  it "should have params" do
    parmas = {
      name: "Apertura 2016",
      year: "2016"
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

describe "save week" do
  it "should return true" do
    parmas = {
      name: "Apertura 2016",
      year: "2016"
    }
    season = Seasons.create(parmas)
    week = Weeks.create_week({
      season: season,
      week_number: 1
    })
    expect(Weeks.save_week(week, WeekStoreFake)).to eq true
  end
end

describe "new for Form" do
  it "should have all attributes nil" do
    new_for_form = Weeks.new_for_form(SeasonStoreFake)
    expect(new_for_form.season_name).to eq "Apertura Falsa"
    expect(new_for_form.season_id).to eq "1"
    expect(new_for_form.week_number()).to eq ""
  end
end

describe "show page" do
  before(:each) do
    @week_show = Weeks.show_week_page("week_id", WeekStoreFake, TeamStoreFake)
  end

  it "should have information week" do
    expect(@week_show.season_name).to eq "Apertura prueba"
    expect(@week_show.id).to eq "week_id"
    expect(@week_show.week_number).to eq 1
  end

  it "should have all matches for week" do
    expect(@week_show.matches.count).to eq 2
    expect(@week_show.matches.first.home_team.name).to eq "Rayados"
  end

  it "should create new game for week" do
    expect(@week_show.new_match.home_team_id).to eq 0
    expect(@week_show.new_match.away_team_id).to eq 0
    expect(@week_show.new_match.date.blank?).to eq false
  end
end
