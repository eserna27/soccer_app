class Admin::SessionsController < Admin::BaseController
  before_action :is_logged?, only: [:loggin]

  def loggin
  end

  def log
    if params[:user_name] == "eserna27" && params[:password] == "1234Secret"
      session[:admin] = "YouAreAdmin"
      redirect_to admin_menu_index_path
    else
      session[:admin] = ""
      redirect_to admin_loggin_path
    end
  end

  private
  def is_logged?
    redirect_to admin_menu_index_path if session[:admin] == "YouAreAdmin"
  end
end
