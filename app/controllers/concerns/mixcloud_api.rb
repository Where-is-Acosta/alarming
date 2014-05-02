module MixcloudApi
  extend ActiveSupport::Concern
  	# Returns embedded player for the mix at the top of the hot list
  	def get_the_popular_one
  		list = RestClient.get(MIXCLOUD[:hotlist], {:params => {:limit => 1}})
  		parse = JSON.parse(list)
  		return "http://api.mixcloud.com#{parse ["data"].first["key"]}embed-html/"
  	end
end