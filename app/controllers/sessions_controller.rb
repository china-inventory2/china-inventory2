class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      log_in user
      remember(user) if params[:session][:remember_me] == '1'
      flash[:success] = 'ログインしました。'
      redirect_to team_items_url(team_id: user.team_id)
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています。'
      render 'top/index'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end
end
