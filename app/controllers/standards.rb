require 'net/http'
require 'uri'

get "/standards" do
  url=URI("https://standards.trails.by/commoncore/q.php?c=math&g=8")

  if request.xhr?
    Net::HTTP.get(url)
  end

end
