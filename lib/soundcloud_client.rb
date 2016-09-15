class SoundcloudClient
  class << self
    def authorize_url
      create_client(response: true)
        .authorize_url(SOUNDCLOUD_CONFIG.auth_config.dup)
    end

    def access_token(code)
      create_client.exchange_token(code: code)['access_token']
    end

    def exchange_client(access_token)
      Soundcloud.new(access_token: access_token)
    end

    private

    def config_params(response)
      SOUNDCLOUD_CONFIG.config_params.dup.tap do |p|
        p[:response_type] = 'code' if response
      end
    end

    def create_client(response: false)
      Soundcloud.new(config_params(response))
    end
  end
end
