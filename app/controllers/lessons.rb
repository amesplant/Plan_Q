# show all lessons
get "/lessons" do
  if session[:user_id]
    user = User.find(session[:user_id])
    @lessons = user.lessons
    erb :"lessons/index"
  else
    erb :"users/new"
  end
end

# new lesson form
get '/lessons/new' do
  if session[:user_id]
    user = User.find(session[:user_id])
    erb :"lessons/new"
  else
    erb :'users/new'
  end
end
