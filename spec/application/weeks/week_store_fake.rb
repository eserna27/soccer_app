module WeekStoreFake
  def self.save_week(week)
    true
  end

  def self.find_week(week_id)
    WeekFake.new(week_id)
  end

  class WeekFake
    attr_reader :id, :season, :week_number, :matches
    def initialize(week_id)
      @id = week_id
      @season = SeasonFake.new
      @week_number = 1
      @matches = [MatchFake.new, MatchFake.new]
    end
  end

  class SeasonFake
    attr_reader :id, :name
    def initialize
      @id = 1
      @name = "Apertura prueba"
    end
  end

  class MatchFake
    attr_reader :home_team_id, :away_team_id, :date, :week
    def initialize
      @home_team_id = 1
      @away_team_id = 2
    end
  end
end
