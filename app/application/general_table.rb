module GeneralTable
  def self.view_table(store_team)
    Table.new(store_team).get_table
  end

  class Table
    def initialize(store_team)
      @json = get_json_liga
      @store_team = store_team
    end

    def get_table
      @teams = create_teams
      order_teams_by_rank
    end

    private
    attr_reader :json, :store_team, :teams

    def create_teams
      @json["DatosJSON"].map do |team|
        Teams::Team.new_team_json(team["rank"], find_team(team))
      end
    end

    def order_teams_by_rank
      @teams.sort! { |a,b| a.ranking <=> b.ranking }
    end

    def find_team(team)
      puts team["idClub"]
      @store_team.find_team_by_id_club(team["idClub"])
    end

    def get_json_liga
      html = "http://www.ligabancomer.mx/ws/aHR0cDovL3NpaWRhZG1pbi5saWdhbXgubmV0L3dlYnNlcnZpY2VzL3BydGxfd2ViX2pzb25kYXRhLmFzaHg@aHNhaD18NTIzNjBjYzdmMjYxYmQ0MGE0OTUwNzY3NGJhOGVmYjcwNDFkZTUzMzNlZTY0ZDgzMDFjZmE5ZjlhNmU4MWQ1YTI2N2NkOGVkNjNlNWU4MWFlNmM5NjdiMTM4MzViMWU2OWE0NTg2OTRiOTE3N2Q5ZmQyMGVhNDBjZjUxMGNiZjV8JnBzV2lkZ2V0PVBSVExfT2ZlbnNpdmEmb2JqSWREaXZpc2lvbj0xJm9iaklkVGVtcG9yYWRhPTY3Jm9iaklEVG9ybmVvPTE="
      JSON.parse((RestClient.get html).body)
    end
  end
end
