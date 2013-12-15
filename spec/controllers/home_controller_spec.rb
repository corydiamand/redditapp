require 'spec_helper'

describe HomeController do

	describe "parse_frontpage_permalinks" do
		it "returns an array with 25 permalinks in it" do

			require 'net/http'
			url = URI.parse('http://www.reddit.com/.json')
			req = Net::HTTP::Get.new(url.path)
			res = Net::HTTP.start(url.host, url.port) {|http|
			  http.request(req)
			}
		
			frontpage_response = JSON.parse(res.body)

			returned_array = controller.parse_frontpage_permalinks(frontpage_response)
			returned_array.class.should == Array
			returned_array.length.should == 25
			returned_array[0].should include("http://www.reddit.com/r/")
		end
	end

end
