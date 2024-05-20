class AddGenreAndHotToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :genre, :string, default: '未分類', null: false
    add_column :menus, :hot, :string, default: '未分類', null: false
  end
end
