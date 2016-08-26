class Admin::MenuController < Admin::BaseController
  before_action :is_admin?, only: [:index]

  def index
  end

  private

  def is_admin?
    redirect_to admin_loggin_path if session[:admin] != "YouAreAdmin"
  end
end
