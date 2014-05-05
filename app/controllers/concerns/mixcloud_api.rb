module MixcloudApi
  extend ActiveSupport::Concern
  	# Returns embedded player for the mix at the top of the hot list
  	def get_the_popular_one
  		list = RestClient.get(MIXCLOUD[:hotlist], {:params => {:limit => 1}})
  		parse = JSON.parse(list)
  		mix = RestClient.get("http://api.mixcloud.com#{parse ["data"].first["key"]}embed-json/")
  		mix.sub! 'src="//', 'src="http://'
  		mix.sub! 'autoplay=', 'autoplay=1'
  		object = JSON.parse(mix)
  		return object ["html"]
  	end
end