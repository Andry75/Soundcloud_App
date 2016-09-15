class ProfileSync < ApplicationService
  attr_accessor :exchange_code, :access_token, :profile, :user

  def initialize(code, user)
    self.exchange_code = code
    self.user = user
  end

  protected

  def _perform
    get_access_token && fetch_profile && create_or_update_user
  end

  def get_access_token
    self.access_token = SoundcloudClient.access_token(exchange_code)
    true
  rescue SoundCloud::ResponseError => _e
    errors << 'Authentication faild'
    false
  end

  def fetch_profile
    self.profile = Profile.new(profile_data)
    profile.access_token = access_token
    true
  end

  def client
    @client ||= SoundcloudClient.exchange_client(access_token)
  end

  def profile_data
    client.get('/me')
  end

  def create_or_update_user
    user.assign_attributes(profile.attributes)
    user.save!
  rescue ActiveRecord::RecordNotSaved => _e
    errors << 'User not saved'
    false
  end
end
