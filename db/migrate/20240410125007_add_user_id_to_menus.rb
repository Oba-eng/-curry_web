class AddUserIdToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :user_id, :integer
    add_foreign_key :menus, :users
  end
end
