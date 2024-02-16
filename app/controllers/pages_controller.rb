class PagesController < ApplicationController
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
