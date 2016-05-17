class TeamsController < ApplicationController
  def all
    @teams = Teams.all_teams(Teams::TeamStore)
  end

  def show
    @team = Teams.view_team(params[:id], Teams::TeamStore)
  end
end
