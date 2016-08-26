require 'active_model'

module Weeks
  class Week
    include ActiveModel::Model

    attr_reader :season, :week_number, :season_name, :season_id, :id, :matches

    def initialize(params)
      @id = params[:id]
      @season = params[:season]
      @week_number = params[:week_number]
      @season_name = params[:season_name]
      @season_id = params[:season_id]
      @matches = params[:matches]
    end

    def self.new_for_form(season_store)
      season = current_season(season_store)
      new({
        season_id: season.id,
        season_name: season.name,
        week_number: ""
      })
    end

    def self.new_from_store(week, store_team)
      new({
        id: week.id,
        week_number: week.week_number,
        season_id: week.season.id,
        season_name: week.season.name,
        matches: converts_in_match(week.matches, store_team)
        })
    end

    def self.show_week_page(week_id, week_store, store_team)
      week = new_from_store(find_week(week_id, week_store), store_team)
    end

    def new_match
      Matches.new_for_form(self)
    end

    def params
      {
        season_id: season.to_i,
        week_number: week_number
      }
    end

    private

    def self.current_season(season_store)
      Seasons::Season.current_season(season_store)
    end

    def self.find_week(week_id, week_store)
      week_store.find_week(week_id)
    end

    def self.converts_in_match(matches, store_team)
      matches.map do |match|
        Matches::Match.new_match_from_store(match, store_team)
      end
    end
  end
end
