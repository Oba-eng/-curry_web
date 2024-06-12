class GoogleLoginApiController < ApplicationController
  skip_before_action :require_login
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: '212565794221-0799kda9o36nic7us68lel6etq4aps6v.apps.googleusercontent.com')
    user = User.find_or_create_by(email: payload['email']) do |user|
      user.name = payload['name']
      user.password = payload['name']
    end
    user.save if user.new_record?
    session[:user_id] = user.id
    redirect_to root_path, success: 'ログインしました'
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path, danger: '不正なアクセスです'
    end
  end
end
