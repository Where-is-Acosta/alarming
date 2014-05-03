=begin
class AuthorizeMixcloudService

  MIXCLOUD_CREDENTIALS[:client]
  MIXCLOUD_CREDENTIALS[:secret]

  # Sets up a new client with Mixcloud oAuth details then starts the authorization service
  def initialize
    client = OAuth2::Client.new(MIXCLOUD_CREDENTIALS[:client], MIXCLOUD_CREDENTIALS[:secret], site: MIXCLOUD_CREDENTIALS[:site])
    authenticate!(client)
  end

  def callback!(code)
    
    
    
  end

  private
 
  def authenticate!(client)
    client.auth_code.authorize_url(redirect_uri: 'http://localhost:3000/auth/mixcloud/callback')  
    token = client.auth_code.get_token(authcode, :redirect_uri => 'http://localhost:8080/oauth2/callback')
    response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })

    @user.mixcloud_api_key = response.class.name
    @user.save
  end

end
=end