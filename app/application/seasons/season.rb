class Season
  attr_reader :name, :year, :teams

  def initialize(params)
    @name = params[:name]
    @year = params[:year]
    @teams = params[:teams]
  end
end
