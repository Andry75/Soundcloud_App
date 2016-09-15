class CreatePlaylistEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :playlist_entities do |t|
      t.belongs_to :playlist, index: true
      t.belongs_to :track, index: true
      t.timestamps
    end
  end
end
