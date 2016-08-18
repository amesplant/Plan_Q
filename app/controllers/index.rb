get '/' do
  if logged_in?
    @title = "Plan Q"
    erb :index
  else
    erb :"sessions/new"
  end
end
