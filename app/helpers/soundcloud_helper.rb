module SoundcloudHelper
  def last_sync_date(user)
    if user.tracks.any?
      current_user.tracks.last.updated_at
    else
      flash[:warning] = "Looks like you haven't any tracks
                         in your Soundcloud profile!"
    end
  end
end
