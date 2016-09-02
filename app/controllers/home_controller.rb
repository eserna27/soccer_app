require 'rest-client'
class HomeController < ApplicationController
  def welcome
    @week = Weeks.show_week_page(Week.last.id, Weeks::WeekStore, Teams::TeamStore)
    @season_calendar = Seasons.current_season_weeks(Seasons::SeasonStore, Teams::TeamStore)
    @general_table = GeneralTable.view_table(Teams::TeamStore)
  end
end
