Rails.application.config.middleware.use OmniAuth::Builder do
	#provider "soundcloud", 'e793efe7e5e8e7cb11c6a51d2b6db8ee', 'f69e0401752cc1718386a61fc0ab0e24'
	provider :mixcloud, "pJZhwjWzYQdxeBjDqp", "a2CPW9AEessrkpugDjBy8exKat36bDGC", provider_ignores_state: true
if Rails.env.development? 
	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end
end
if Rails.env.development? 
	OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
end
#  MIXCLOUD_CREDENTIALS[:client]
#  MIXCLOUD_CREDENTIALS[:secret]