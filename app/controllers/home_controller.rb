class HomeController < ApplicationController
  def welcome
    @week = Weeks.show_week_page(Week.last.id, Weeks::WeekStore, Teams::TeamStore)
  end
end
