class AddArtworkUidToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :artwork_uid, :string
  end
end
