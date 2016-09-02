class Admin::WeeksController < Admin::BaseController
  def new
    @week = Weeks.new_for_form(Seasons::SeasonStore)
    @weeks = Seasons.current_season_weeks(Seasons::SeasonStore, Teams::TeamStore)
  end

  def create
    if Weeks.save_week(Weeks.create_week(params_week), Weeks::WeekStore)
      redirect_to admin_menu_index_path
    end
  end

  def show
    @week = Weeks.show_week_page(params[:id], Weeks::WeekStore, Teams::TeamStore)
  end

  private
  def params_week
    {
      season: params[:weeks_week][:season_id],
      week_number: params[:weeks_week][:week_number]
    }
  end
end
