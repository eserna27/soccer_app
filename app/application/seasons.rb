require_relative 'seasons/season'

module Seasons
  def self.create(params)
    Season.new(params)
  end

  def self.save_season(season, season_store)
    season_store.save_season(season)
  end

  def self.current_season_weeks(season_store)
    season_store.current_season.weeks
  end
end
