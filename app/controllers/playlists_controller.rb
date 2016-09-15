class PlaylistsController < ApplicationController
  def index
    if soundcloud_connected_and_have_playlists?
      @playlists = current_user.playlists
    else
      no_sync_content('playlists')
    end
  end

  def show
  end

  def playlist
    current_user.playlists.find_by(id: params[:id])
  end
  helper_method :playlist

  private

  def soundcloud_connected_and_have_playlists?
    current_user.soundcloud_connected? && current_user.playlists.any?
  end
end
