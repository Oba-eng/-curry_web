class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  authenticates_with_sorcery!

  has_many :menus, :dependent => :destroy

  # Googleログイン
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

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

  def self.create_from(provider, auth_hash)
    create! do |user|
      user.name = auth_hash['info']['name'] || auth_hash['info']['nickname']
      user.email = auth_hash['info']['email']
      user.crypted_password = SecureRandom.hex(10) # or any other secure password mechanism
    end
  end

end
