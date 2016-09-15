class TracksController < ApplicationController
  def index
    if current_user.soundcloud_connected?
      @tracks = current_user.tracks
    else
      no_sync_content('tracks')
    end
  end

  def show
  end
end
