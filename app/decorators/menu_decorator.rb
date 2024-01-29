class MenuDecorator < Draper::Decorator
  delegate_all

  def thumbnail
    object.menu_image.presence || 'menu-default-image.png'
  end
end