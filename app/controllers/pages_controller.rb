class PagesController < ApplicationController
  def privacy
    render 'pages/privacy'
  end

  def terms
    render 'pages/terms'
  end

  def contact
    render 'pages/contact'
  end
end
