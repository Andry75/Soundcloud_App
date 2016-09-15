class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    return if current_user.soundcloud_connected?
    redirect_to status_path
  end
end
