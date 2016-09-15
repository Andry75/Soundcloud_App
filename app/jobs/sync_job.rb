class SyncJob < ApplicationJob
  queue_as :default

  def perform(user)
    TracksSync.new(user).perform &&
      PlaylistsSync.new(user).perform
  end
end
