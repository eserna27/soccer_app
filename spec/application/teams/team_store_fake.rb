require_relative 'teams_fake'

module TeamStoreFake

  def self.save_team(team)
    true
  end

  def self.find_team_with_id(team_id)
    TeamsFake.new_team_with_id(team_id)
  end

  def self.all_teams
    [
      TeamsFake.new_team_with_id("-team-1-"),
      TeamsFake.new_team_with_id("-team-2-")
    ]
  end
end
