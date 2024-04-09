class RemoveUserIdFromMenusAndDropForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :user_id
    remove_index :menus, name: "index_menus_on_user_id"
    remove_foreign_key :menus, :users
  end
end
