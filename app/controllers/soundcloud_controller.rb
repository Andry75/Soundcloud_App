class SoundcloudController < ApplicationController
  before_action :authenticate_user!

  def connect
    redirect_to SoundcloudClient.authorize_url
  end

  def connected
    service = ProfileSync.new(params[:code], current_user)
    if service.perform
      flash[:success] = 'Soundcloud profile connected successfully!'
      sync_content(current_user)
      redirect_to status_path
    else
      @errors = service.errors.dup
    end
  end

  def status
  end

  def sync
    sync_content(current_user)
    flash[:info] = 'Content started syncing!'
    redirect_to :back
  end

  def destroy
    current_user.disconnect_from_soundcloud!
    redirect_to :back
  end

  private

  def sync_content(user)
    SyncJob.perform_later(user)
  end
end
