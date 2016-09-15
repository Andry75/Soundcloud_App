class AddDeviseFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    ## Database authenticatable

    add_column :users, :encrypted_password, :string, null: false, default: ''

    ## Recoverable

    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable

    add_column :users, :remember_created_at, :datetime

    ## Trackable

    add_column :users, :sign_in_count, :integer, null: false, default: 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :last_sign_in_ip, :inet

    ## Indexes

    add_index :users, :login,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
