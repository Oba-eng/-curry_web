class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id 
      redirect_to menus_path, success: 'サインアップしました'
    else
      flash.now[:danger] = 'サインアップに失敗しました'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @menus = @user.menus

    favorites = Favorite.where(user_id: current_user.id).pluck(:menu_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Menu.find(favorites)     # menusテーブルから、お気に入り登録済みのレコードを取得
  end
    
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

