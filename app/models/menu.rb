class Menu < ApplicationRecord
  mount_uploader :menu_image, MenuImageUploader
  
  belongs_to :user

  validates :name, presence: { message: 'メニュー名を入力してください' }
  validates :menu_image, presence: { message: "メニュー画像を選択してください" }
  validates :material, presence: { message: '材料を入力してください' }
  validates :quantity, presence: { message: '分量を入力してください' }
  validates :make, presence: { message: '作り方を入力してください' }
  validates :point, presence: { message: 'ポイントを入力してください' }
  validates :genre, presence: { message: 'ジャンルを選択してください' }
  validates :hot, presence: { message: '辛さレベルを選択してください' }

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

  validate :make_present
  validate :material_present
  validate :quantity_present
  
  private

  def make_present
    if make.blank? || make.all?(&:blank?)
      errors.add(:make, '作り方を入力してください')
    end
  end

  def material_present
    if material.blank? || material.all?(&:blank?)
      errors.add(:material, '材料を入力してください')
    end
  end

  def quantity_present
    if quantity.blank? || quantity.all?(&:blank?)
      errors.add(:quantity, '分量を入力してください')
    end
  end
end
