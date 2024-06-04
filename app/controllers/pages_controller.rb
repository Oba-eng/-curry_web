class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[privacy terms]

  def privacy
    @q = Menu.ransack(params[:q])
    render 'pages/privacy'
  end

  def terms
    @q = Menu.ransack(params[:q])
    render 'pages/terms'
  end

  def contact
    @q = Menu.ransack(params[:q])
    render 'pages/contact'
  end
end
