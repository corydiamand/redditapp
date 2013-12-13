class HomeController < ApplicationController

	def index
		require 'net/http'

		url = URI.parse('http://www.reddit.com/.json')
		req = Net::HTTP::Get.new(url.path)
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		#puts res.body
		@frontpage = JSON.parse(res.body)
		@frontpagetitles = @frontpage["data"]
		puts parse_reddit_data(@frontpage)
	end

	def search
	end

	def parse_reddit_data(reddit_data)
		puts reddit_data
	end

end