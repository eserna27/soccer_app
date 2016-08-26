class MatchesController < ApplicationController
  def show
    @match = Matches.find_match(params[:id], Matches::MatchStore, Teams::TeamStore)
  end
end
