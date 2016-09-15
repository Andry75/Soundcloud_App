class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.belongs_to :user, index: true
      t.integer :soundcloud_id, index: true
      t.string :title
      t.timestamps
    end
  end
end
