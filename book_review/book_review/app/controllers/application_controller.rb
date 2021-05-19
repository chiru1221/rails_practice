class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_current_user
  #before_action :requre_admin

  private
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def require_login
    unless session[:user_id]
      flash[:login_error] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end

  def require_admin
    #unless User.find_by(id: session[:user_id]).admin?
    unless User&.find_by(id: session[:user_id])&.admin?
      flash[:error] = "You are not admin."
      redirect_to reviews_url
    end
  end

  def require_reviewer
    unless User&.find_by(id: session[:user_id])&.reviewer?
      flash[:error] = "You are not reviewer."
      redirect_to reviews_url
    end
  end

end
