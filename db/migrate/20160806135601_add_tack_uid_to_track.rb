class AddTackUidToTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :data_set_uid, :string
    add_column :tracks, :artwork_uid, :string
  end
end
