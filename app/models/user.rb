class User < ApplicationRecord
  prepend DeleteWithAttachments

  has_many :playlists, dependent: :destroy
  has_many :tracks, dependent: :destroy
  dragonfly_accessor :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def soundcloud_connected?
    soundcloud_user_id.present?
  end

  def login_or_email
    soundcloud_connected? ? login : email
  end

  def disconnect_from_soundcloud!
    destroy_synchronized_content!
    destroy_credentials_of_soundcloud
    save
  end

  private

  def destroy_synchronized_content!
    playlists.destroy_all
    tracks.destroy_all
  end

  def destroy_credentials_of_soundcloud
    self.soundcloud_user_id = nil
    self.soundcloud_access_token = nil
    self.login = nil
    self.first_name = nil
    self.last_name = nil
    self.avatar_url = nil
    self.avatar = nil
  end
end
