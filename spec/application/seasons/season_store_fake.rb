module SeasonStoreFake
  def self.save_season(season)
    true
  end

  def self.current_season
    SeasonFake.new
  end

  class SeasonFake
    attr_reader :id, :name

    def initialize
      @id = "1"
      @name = "Apertura Falsa"
    end
  end
end
