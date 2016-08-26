class Admin::MatchesController < Admin::BaseController
  def create
    if Matches.save_match(Matches.create_from_form(params[:matches_match]), Matches::MatchStore)
      redirect_to admin_week_path(params[:matches_match][:week_id])
    end
  end
end
