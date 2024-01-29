class Menu < ApplicationRecord
  mount_uploader :menu_image, MenuImageUploader
  
  belongs_to :user

  # お気に入り機能
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy 

  def favorited_by(user)
    Favorite.find_by(user_id: user.id, menu_id: id)
  end

  # 検索機能
  def self.search(query)
    ransack(name_or_material_cont: query).result
  end
end
