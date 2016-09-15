class AddToUserProfileColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :login, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar_url, :string
    add_index :users, :id
  end
end
