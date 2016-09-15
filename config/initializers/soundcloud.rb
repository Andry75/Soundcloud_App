SOUNDCLOUD_CONFIG = OpenStruct.new(
  auth_config: {
    grant_type: 'authorization_code',
    scope: 'non-expiring',
    display: 'popup'
  },
  config_params: {
    client_id: ENV['SOUNDCLOUD_CLIENT_ID'],
    client_secret:  ENV['SOUNDCLOUD_CLIENT_SECRET'],
    redirect_uri: 'http://localhost:3000/soundcloud/oauth-callback'
})
