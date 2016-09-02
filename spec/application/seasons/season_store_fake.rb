require_relative '../weeks/weeks_fake'

module SeasonStoreFake
  def self.save_season(season)
    true
  end

  def self.current_season
    SeasonFake.new
  end

  class SeasonFake
    attr_reader :id, :name, :weeks, :year, :league

    def initialize
      @id = "1"
      @name = "Apertura Falsa"
      @year = "1991"
      @league = "Mexicana"
      @weeks = [WeekFake.new(1), WeekFake.new(2)]
    end
  end
end
