module Teams
  class TeamStore
    def self.all_teams
      ::Team.all
    end

    def self.find_team_with_id(team_id)
      ::Team.find(team_id)
    end
  end
end
