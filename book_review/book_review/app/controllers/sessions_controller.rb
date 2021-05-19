class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new

  end

  def create
    if session[:user_id]
      flash[:alert] = 'ログイン中です。ログアウトしてください。'
      redirect_to books_url
    else
      user = User.find_by(userid: params[:userid])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to books_url
      else
        flash[:alert] = 'パスワードまたはIDが違います'
        redirect_to login_url
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_url
  end
end
