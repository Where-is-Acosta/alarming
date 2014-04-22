class AuthorizeMixcloudService

  MIXCLOUD_CREDENTIALS[:client]
  MIXCLOUD_CREDENTIALS[:secret]

  def initialize
    client = OAuth2::Client.new(MIXCLOUD_CREDENTIALS[:client], MIXCLOUD_CREDENTIALS[:secret], site: MIXCLOUD_CREDENTIALS[:site])
    authenticate!(client)
  end

  def callback!(code)
    
    
    
  end

  private
  
  def authenticate!(client)
    client.auth_code.authorize_url(redirect_uri: 'http://localhost:3000/auth/mixcloud/callback')  
    token = client.auth_code.get_token('authorization_code_value', :redirect_uri => 'http://localhost:8080/oauth2/callback', :headers => {'Authorization' => 'Basic some_password'})
    response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })

    @user.mixcloud_api_key = response.class.name
    @user.save
  end

end