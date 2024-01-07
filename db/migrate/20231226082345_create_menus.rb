class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :material, null: false
      t.text :make, null: false
      t.text :point, null: false

      t.timestamps
    end
  end
end
