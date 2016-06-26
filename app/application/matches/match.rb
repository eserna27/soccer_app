class Match
  attr_reader :home_team, :away_team ,:date
  attr_accessor :errors

  def initialize(params)
    @home_team = params[:home_team]
    @away_team = params[:away_team]
    @date = params[:date]
    @errors = []
  end

  def self.new_match(params)
    new({
      home_team: params[:home_team],
      away_team: params[:away_team],
      date: params[:date]
      })
  end

  def validate
    (home_team == "" || away_team == "") && add_error("miss_team")
    (home_team == away_team) && add_error("same_team")
    date.nil? && add_error("need_date")
  end

  private

  def add_error(error)
    errors << error
  end
end
