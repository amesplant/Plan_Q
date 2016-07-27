get '/' do
  if logged_in?
    erb :index
  else
    erb :"users/new"
  end
end
