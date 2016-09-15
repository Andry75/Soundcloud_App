class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :soundcloud_user_id
      t.string :soundcloud_access_token

      t.timestamps
    end
    add_index :users, :soundcloud_user_id
    add_index :users, :soundcloud_access_token
  end
end
