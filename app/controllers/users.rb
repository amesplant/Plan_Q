# when users have successfully logged in ... send them to ... wherever
get '/users' do

  erb :index
end

# send to registration form
get "/users/new" do
  erb :"users/new"
end

# process registration form
post "/users" do
  @user = User.new(params[:user])
  p @user
  #saves new user or returns false if unsuccessful
  if @user.save
    session[:user_id] = @user.id
    # try AJAX
    if request.xhr?
      return "success"
    else
      redirect "/"
    end

  else
    @errors = @user.errors
    # try AJAX
    if request.xhr?
      # Sinatra doesn't understand @errors, so send the errors back as a json object
      content_type :json
      @errors.to_json
    else
      erb :"/users/new" # show errors
    end
  end
end
