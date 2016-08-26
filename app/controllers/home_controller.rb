class HomeController < ApplicationController
  def welcome
    @week = Weeks.show_week_page(7, Weeks::WeekStore, Teams::TeamStore)
  end
end
