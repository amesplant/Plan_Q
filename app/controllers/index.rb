get '/' do
  if session[:user_id]
    erb :index
  else
    erb :"users/new"
  end
end
