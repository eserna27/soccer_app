class Week
  attr_reader :season, :week_number, :matches

  def initialize(params)
    @season = params[:season]
    @week_number = params[:week_number]
    @matches = []
  end

  def add_match(match)
    @matches << match
  end
end
