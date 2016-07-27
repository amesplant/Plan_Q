# show all lessons
get "/lessons" do
  if logged_in
    user = User.find(session[:user_id])
    @lessons = user.lessons
    erb :"lessons/index"
  else
    erb :"users/new"
  end
end

# new lesson form
get '/lessons/new' do
  if logged_in?
    user = User.find(session[:user_id])
    erb :"lessons/new"
  else
    erb :'users/new'
  end
end

# prosess new lesson
post '/lessons' do
  @lesson = Lesson.new(params[:lesson])
  if @lesson.save
    # try AJAX
    if request.xhr?
      return "success"
    else
      redirect "/lessons"
    end
  else
    @errors = @lesson.errors
    # try AJAX
    if request.xhr?
      # Sinatra doesn't understand @errors, so send the errors back as a json object
      content_type :json
      @errors.to_json
    else
      erb :"/lessons/new" # show errors
    end
  end
end
