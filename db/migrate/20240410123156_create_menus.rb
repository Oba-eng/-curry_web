class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.text :material, array: true, default: []
      t.text :quantity, array: true, default: []
      t.text :make, array: true, default: []
      t.text :point, null: false
      t.text :menu_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end