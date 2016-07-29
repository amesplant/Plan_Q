require 'net/http'
require 'uri'
require 'rest_client'

get "/standards" do
  url=URI("https://standards.trails.by/commoncore/q.php?c=math&g=8")

  # headers = { :content_type => 'application/json', :authorization => 'Bearer TOKEN' }

  if request.xhr?
    Net::HTTP.get(url)
    # RestClient.get 'https://partner.opened.com/1/standard_groups.json', headers
  end

end
