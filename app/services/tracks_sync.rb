class TracksSync < ApplicationService
  attr_accessor :user, :soundlcloud_tracks

  def initialize(user)
    self.user = user
  end

  protected

  def _perform
    get_list_of_tracks && download_and_add_tracks
  end

  def get_list_of_tracks
    self.soundlcloud_tracks = client.get('/me/tracks')
    soundlcloud_tracks.present?
  end

  def download_and_add_tracks
    soundlcloud_tracks.all? do |t|
      add_or_update_track(t)
    end
  end

  def add_or_update_track(soundcloud_track)
    find_or_create_track(soundcloud_track).tap do |track|
      set_track_file(track, soundcloud_track)
      set_artwork(track, soundcloud_track)
      set_or_update_track_attributes(track, soundcloud_track)
    end.save!
  rescue ActiveRecord::RecordNotSaved => _e
    errors << "Track: #{track.title} not saved"
    false
  end

  def find_or_create_track(soundcloud_track)
    user.tracks.find_or_initialize_by(soundcloud_id: soundcloud_track.id)
  end

  def set_track_file(track, soundcloud_track)
    return if track.persisted?

    Tempfile.new(tmp_filename(soundcloud_track)).binmode.tap do |tmp_file|
      tmp_file.write(download_file(soundcloud_track))
      track.data_set = tmp_file
    end
  end

  def download_file(soundcloud_track)
    client.get(soundcloud_track.download_url)
  end

  def tmp_filename(soundcloud_track)
    ['track', ".#{soundcloud_track.original_format}"]
  end

  def set_artwork(track, soundcloud_track)
    track.artwork = get_artwork(soundcloud_track.artwork_url)
  rescue => _e
    errors << "Track: #{track.title} don't has artwork image"
  end

  def set_or_update_track_attributes(track, soundcloud_track)
    track.assign_attributes(track_attributes(soundcloud_track))
  end

  def get_artwork(url)
    Dragonfly.app.fetch_url(url)
  end

  def track_attributes(soundcloud_track)
    TrackInfo.new(soundcloud_track).attributes
  end

  def client
    SoundcloudClient.exchange_client(user.soundcloud_access_token)
  end
end
