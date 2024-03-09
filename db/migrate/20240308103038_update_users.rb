class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :password_digest
      t.string :crypted_password, null: false, default: ""  # 初期値を追加
      t.string :salt, null: false, default: ""              # 初期値を追加
    end
  end
end