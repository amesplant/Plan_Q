get "/login" do
  erb :"sessions/new"
end

# process the login form
post "/sessions" do
  # find the user that is trying to login
  user = User.find_by(email: params[:user][:email])
  # if there is a user and passes authentication of password
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/"
  else
    @error = "Can you try that again? I didn't find a match"
    erb :"sessions/new"
  end
end

# logout of the session
delete "/sessions" do
  session[:user_id] = nil
  redirect "sessions/new"
end
