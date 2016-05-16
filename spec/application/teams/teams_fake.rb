class TeamsFake
  attr_reader :name, :twitter, :hashtags, :id

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
    @twitter = params[:twitter]
    @hashtags = params[:hashtags]
  end

  def self.new_team_with_id(team_id)
    new({
      id: team_id,
      name: "Rayados",
      twitter: "@Rayados",
      hashtags: "#Rayados"
      })
  end

  def self.new_team_with_name(name)
    new({
      id: "--id--",
      name: name
      })
  end
end
