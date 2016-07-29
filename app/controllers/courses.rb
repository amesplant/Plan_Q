get "/courses" do

  @courses = "placeholder for courses to pull from db"
  if request.xhr?
    erb :"/courses/_courses", layout: false, locals: {courses: @courses }
  else
    # redirect :"/courses"
  end
end


# new course form
get '/courses/new' do
  if logged_in?
    user = User.find(session[:user_id])
    erb :"courses/new"
  else
    erb :'users/new'
  end
end
