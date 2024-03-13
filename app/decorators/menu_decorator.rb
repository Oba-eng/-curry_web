class MenuDecorator < Draper::Decorator
  delegate_all

  def menu_image
    object.menu_image.presence || 'menu-default-image.png'
  end
end