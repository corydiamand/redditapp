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
		@frontpage2 = []

		@frontpage["data"]["children"].each do |x|
			@frontpage2.push(x["data"]["permalink"])
		end

		
	
	end

	def search
	end

	def parse_permalinks(reddit_data)
		
	end

end