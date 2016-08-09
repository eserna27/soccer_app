module Teams
  class TeamStore
    def self.all_teams
      ::Team.all
    end

    def self.find_team_with_id(team_id)
      ::Team.find(team_id)
    end

    def self.save_team(team)
      ::Team.create(team.params)
    end
  end
end
