class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]

  def new
    @q = Menu.ransack(params[:q])
  end

  def create
    @q = Menu.ransack(params[:q])
    @user = login(params[:email], params[:password])

    if @user
      redirect_to menus_path, success: 'ログインしました'
    else
      redirect_to new_session_path, danger: 'ログインに失敗しました'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, success: 'ログアウトしました'
  end


  private

  def session_params
    params.permit(:email, :password)
  end

end
