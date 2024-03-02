class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    menu = Menu.find(params[:menu_id])
    current_user.favorite(menu)
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end

  def destroy
    menu = current_user.favorites.find(params[:id]).menu
    current_user.unfavorite(menu)
    redirect_back fallback_location: root_path, success: t('defaults.message.unbookmark')
  end

end
