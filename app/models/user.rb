class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  authenticates_with_sorcery!

  has_many :menus, :dependent => :destroy

  # お気に入り機能
  has_many :favorites, :dependent => :destroy
  has_many :favorite_menus, through: :favorites, source: :menu


  def own?(object)
    id == object.user_id
  end

  def favorite(menu)
    favorite_menus << menu
  end

  def unfavorite(menu)
    favorite_menus.destroy(menu)
  end

  def favorite?(menu)
    favorite_menus.include?(menu)
  end

  def password_digest
    crypted_password
  end

end
