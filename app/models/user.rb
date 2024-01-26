class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true

  has_many :menus

  # お気に入り機能
  has_many :favorites, dependent: :destroy

  def mine?(object)
    id == object.user_id
  end
end
