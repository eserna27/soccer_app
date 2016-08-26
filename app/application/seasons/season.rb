module Seasons
  class Season
    attr_reader :name, :year, :league

    def initialize(params)
      @name = params[:name]
      @year = params[:year]
      @league = params[:league]
    end

    def params
      {
        name: name,
        year: year.to_int,
        league: league,
      }
    end

    def self.current_season(season_store)
      season_store.current_season
    end
  end
end
