class Match
  attr_reader :home_team, :away_team
  attr_accessor :errors

  def initialize(params)
    @home_team = params[:home_team]
    @away_team = params[:away_team]
    @errors = []
  end

  def self.new_match(params)
    new({
      home_team: params[:home_team],
      away_team: params[:away_team],
      })
  end

  def validate
    add_error("miss_team") if home_team == "" || away_team == ""
  end

  private

  def add_error(error)
    errors << error
  end
end
