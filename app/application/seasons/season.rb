module Seasons
  class Season
    attr_reader :name, :year, :league, :weeks, :id

    def initialize(params)
      @name = params[:name]
      @year = params[:year]
      @league = params[:league]
      @weeks = params[:weeks]
      @id = params[:id]
    end

    def params
      {
        name: name,
        year: year.to_int,
        league: league,
      }
    end

    def self.new_from_store(season, team_store)
      new({
        id: season.id,
        name: season.name,
        year: season.year,
        league: season.league,
        weeks: match_from_store(season.weeks, team_store)
        })
    end

    def self.current_season(season_store, team_store)
      new_from_store(season_store.current_season, team_store)
    end

    private
    def self.match_from_store(weeks, team_store)
      weeks.map { |week| Weeks::Week.new_from_store(week, team_store) }
    end
  end
end
