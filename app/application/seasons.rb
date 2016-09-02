require_relative 'seasons/season'

module Seasons
  def self.create(params)
    Season.new(params)
  end

  def self.save_season(season, season_store)
    season_store.save_season(season)
  end

  def self.current_season_weeks(season_store, team_store)
    Seasons::Season.current_season(season_store, team_store)
  end
end
