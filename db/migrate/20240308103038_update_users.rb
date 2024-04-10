class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      # パスワードダイジェストを削除するため、型を指定して remove_column メソッドを使用する
      t.remove :password_digest, :string
      # crypted_password と salt カラムを追加
      t.string :crypted_password, null: false, default: ""
      t.string :salt, null: false, default: ""
    end
  end
end
