class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :material
      t.text :make
      t.text :point

      t.timestamps
    end
  end
end
