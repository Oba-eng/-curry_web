class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]

  def new
    @q = Menu.ransack(params[:q])
  end

  def create
    @q = Menu.ransack(params[:q])
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to menus_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
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
