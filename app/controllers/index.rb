get '/' do
  if logged_in?
    erb :index
  else
    erb :"sessions/new"
  end
end
