class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
    @q = Menu.ransack(params[:q])
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
    @q = Menu.ransack(params[:q])
    @name = current_user.name
    @menus = current_user.menus
  end

  def edit
    @q = Menu.ransack(params[:q])
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
      flash[:success] = 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    reset_session
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root
  end

  def favorites 
    @q = Menu.ransack(params[:q])
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:menu_id)
    @favorite_menus = Menu.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

