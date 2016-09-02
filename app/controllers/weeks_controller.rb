class WeeksController < ApplicationController
  def show
    @week = Weeks.show_week_page(params[:id], Weeks::WeekStore, Teams::TeamStore)
  end
end
