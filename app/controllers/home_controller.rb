class HomeController < ApplicationController

	def index
		require 'net/http'

		url = URI.parse('http://www.reddit.com/.json')
		req = Net::HTTP::Get.new(url.path)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		
		#@frontpage = JSON.parse(res.body)
		@frontpage = JSON.parse(res.body)
		#@frontpage2 = []
		@frontpage2 = parse_frontpage_permalinks(@frontpage)
		#@frontpage["data"]["children"].each do |x|
		#	@frontpage2.push("http://www.reddit.com"+x["data"]["permalink"])
		#end


	end

	def search
	end

	def parse_frontpage_permalinks(frontpage_json)
		permalink_array = []
		
		frontpage_json["data"]["children"].each do |x|

			permalink_array.push("http://www.reddit.com"+x["data"]["permalink"])

		end
		permalink_array
	end

end