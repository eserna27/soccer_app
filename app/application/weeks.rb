require_relative 'weeks/week'

module Weeks
  def self.create_week(params)
    Weeks::Week.new(params)
  end

  def self.save_week(week, store_week)
    store_week.save_week(week)
  end

  def self.new_for_form(season_store, team_store)
    Weeks::Week.new_for_form(season_store, team_store)
  end

  def self.show_week_page(week_id, season_store, store_team)
    Weeks::Week.show_week_page(week_id, season_store, store_team)
  end
end
