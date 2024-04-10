class RemoveCryptedPasswordAndSaltFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :crypted_password
    remove_column :users, :salt
  end
end
