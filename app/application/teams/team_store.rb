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

    def self.find_team_by_id_club(id_club)
      ::Team.find_by(id_club: id_club)
    end
  end
end
