class ChangePasswordColumn < ActiveRecord::Migration
  def change
    remove_column :users, :password_confirm, :string
    add_column :users, :password_digest, :string
  end
end