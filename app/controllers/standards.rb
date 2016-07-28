require 'net/http'

get "/standards" do
  url="https://standards.trails.by/commoncore/q.php?c=math&g=8"

  if request.xhr?
    return url
  end
end
