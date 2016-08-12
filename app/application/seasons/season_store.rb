module Seasons
  class SeasonStore
    def self.save_season(season)
      ::Season.create(season.params)
    end
  end
end
