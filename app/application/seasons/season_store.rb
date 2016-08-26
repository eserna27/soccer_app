module Seasons
  class SeasonStore
    def self.save_season(season)
      ::Season.create(season.params)
    end

    def self.current_season
      ::Season.first
    end
  end
end
