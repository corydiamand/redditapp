class HomeController < ApplicationController

	def index

		#@frontpage = request_page('http://www.reddit.com/.json')
		#@frontpage2 = parse_frontpage_permalinks(@frontpage)
		#@frontpage3 = get_frontpage_comments

	end
	

	def search
	end

	#give this method a .json url!
	def request_page(page)
		require 'net/http'

		url = URI.parse(page)
		req = Net::HTTP::Get.new(url.path)
		req.add_field('User-Agent', 'ReddyTapp/1.0 https://github.com/corydiamand/redditapp')
		res = Net::HTTP.start(url.host, url.port) {|http|
		  http.request(req)
		}
		
		JSON.parse(res.body)
	end

	def parse_frontpage_permalinks(frontpage_json)

		permalink_array = []
		
		frontpage_json["data"]["children"].each do |x|
			permalink_array.push("http://www.reddit.com"+x["data"]["permalink"])
		end

		permalink_array

	end

	def get_frontpage_comments()
		request = request_page('http://www.reddit.com/.json')
		frontpage_links = parse_frontpage_permalinks(request)
		comments_array = []

		#remove the 0 after frontpage links to get comments for all the links
		frontpage_links[0..1].each do |link|
			comments_array.push(request_page(link+".json"))
		end
		comments_array
	end

end