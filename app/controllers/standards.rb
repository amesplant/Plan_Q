require 'net/http'
require 'uri'
require 'rest_client'

get "/standards" do
  url=URI("https://standards.trails.by/commoncore/q.php?c=math&g=8")
  standards_json = Net::HTTP.get(url)
  standards_hash = JSON.parse(standards_json)
  standards = standards_hash["standards"]

  # headers = { :content_type => 'application/json', :authorization => 'Bearer TOKEN' }

  if request.xhr?
    erb :"/standards/_standards", layout: false, locals: {standards: standards }
    # RestClient.get 'https://partner.opened.com/1/standard_groups.json', headers
  end

end
