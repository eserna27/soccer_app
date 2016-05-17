require_relative 'teams/team'

module Teams
  def self.create(params)
    Team.new_team(params)
  end

  def self.save(team, store_team)
    store_team.save_team(team)
  end

  def self.view_team(team_id, store_team)
    Teams::Team.new_team_from_store(store_team.find_team_with_id(team_id))
  end

  def self.all_teams(store_team)
    store_team.all_teams.map{ |team|
      Teams::Team.new_team_from_store(team)
    }
  end
end
