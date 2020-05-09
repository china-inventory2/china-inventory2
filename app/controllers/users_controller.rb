class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:index, :destroy]
  skip_before_action :admin_user, only: :edit

  def index
    @users = User.paginate(page: params[:page], per_page: 50)
  end

  def show
  end

  def new
    @user = User.new
    @team = Team.new
  end

  def edit
  end

  def create
    account = AccountCreator.new(user_params, team_params)
    # 新規オーナーアカウント作成
    if !logged_in?
      account.team_build
      user = account.user_build
      log_in user
      flash[:success] = "アカウントを作成しました。"
      redirect_to team_items_url(team_id: user.team_id)
    else
      # メンバーアカウント作成
      redirect_to team_items_url(team_id: current_user.team_id)
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = "ユーザーを削除しました。"
    redirect_to users_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:team_id, :name, :employee_number, :line_id, :email, :address, :phone_number, :password, :password_confirmation, :inventory_manager_flg, :reserch_user_flg, :account_bank_name, :account_number, :business_consignment_expenses)
    end

    def team_params
      params.require(:team).permit(:name)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to root_url
      end
    end

    def correct_user
      if !current_user?(@user) || !current_user.admin?
        redirect_to(root_url)
      end
    end

    def admin_user
      if logged_in?
        unless current_user.admin?
          flash[:success] = "権限がありません。"
          redirect_to root_url
        end
      end
    end
end
