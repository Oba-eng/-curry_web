class AddCryptedPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :crypted_password, :string
  end
end
