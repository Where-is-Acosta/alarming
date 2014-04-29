module MixcloudApi
  extend ActiveSupport::Concern

  def get_auth(code)
    client = OAuth2::Client.new(MIXCLOUD_CREDENTIALS[:client], MIXCLOUD_CREDENTIALS[:secret], :site => 'https://www.mixcloud.com')
    auth_code = code   
    token = client.auth_code.get_token(:redirect_uri => 'http://localhost:3000/auth/mixcloud/callback')
    return token
  end

end