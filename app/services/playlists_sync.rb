class PlaylistsSync < ApplicationService
  attr_accessor :user, :soundcloud_playlists

  def initialize(user)
    self.user = user
  end

  protected

  def _perform
    get_playlists && create_or_update_playlists
  end

  def get_playlists
    self.soundcloud_playlists = client.get('/me/playlists')
    true
  end

  def create_or_update_playlists
    soundcloud_playlists.all? do |p|
      process_soundcloud_playlist(p)
    end
  end

  def process_soundcloud_playlist(soundcloud_playlist)
    create_or_update_playlist(soundcloud_playlist.id).tap do |playlist|
      set_or_update_playlist_attributes(playlist, soundcloud_playlist)
      set_artwork(playlist, soundcloud_playlist)
      add_track_to_playlist(playlist, soundcloud_playlist)
    end.save!
  end

  def create_or_update_playlist(soundlcloud_id)
    user.playlists.find_or_initialize_by(soundcloud_id: soundlcloud_id)
  end

  def set_or_update_playlist_attributes(playlist, soundcloud_playlist)
    playlist.assign_attributes(playlist_attributes(soundcloud_playlist))
  end

  def set_artwork(playlist, soundcloud_playlist)
    playlist.artwork = get_artwork(soundcloud_playlist.artwork_url)
  rescue
    errors << "Playlist don't has artwork"
  end

  def add_track_to_playlist(playlist, soundcloud_playlist)
    soundcloud_playlist.tracks.all? do |t|
      track = find_track(t.id)
      track_in_playlist?(playlist, track.id) || playlist.tracks << track
    end
  end

  def playlist_attributes(soundcloud_playlist)
    PlaylistInfo.new(soundcloud_playlist).attributes
  end

  def track_in_playlist?(playlist, track_id)
    playlist.tracks.where(id: track_id).any?
  end

  def find_track(id)
    Track.find_by(soundcloud_id: id)
  end

  def get_artwork(url)
    Dragonfly.app.fetch_url(url)
  end

  def client
    SoundcloudClient.exchange_client(user.soundcloud_access_token)
  end
end
