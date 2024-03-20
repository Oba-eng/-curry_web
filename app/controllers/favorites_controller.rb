class FavoritesController < ApplicationController
  before_action :require_login

  def create
    menu = Menu.find(params[:id])
    current_user.favorite(menu)
    redirect_back fallback_location: root_path, success: 'お気に入りに追加しました'
  end

  def destroy
    menu = current_user.favorite_menus.find(params[:menu_id])
    current_user.unfavorite(menu)
    redirect_back fallback_location: root_path, success: 'お気に入りを削除しました'
  end

end
