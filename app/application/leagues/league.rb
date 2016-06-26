class League
  attr_reader :name, :location, :teams

  def initialize(params)
    @name = params[:name]
    @location = params[:location]
    @teams = params[:teams]
  end

  def self.new_league(params)
    new({
      name: params[:name],
      location: params[:location],
      teams: params[:teams]
    })
  end
end
