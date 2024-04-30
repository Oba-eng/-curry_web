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
    
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

