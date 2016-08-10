module Seasons
  class Season
    attr_reader :name, :year, :teams, :league

    def initialize(params)
      @name = params[:name]
      @year = params[:year]
      @teams = params[:teams]
      @league = params[:league]
    end
  end
end
