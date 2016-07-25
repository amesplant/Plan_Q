get '/' do
  # Look in app/views/index.erb
  erb :index
end

# return an HTML form for creating a new user
get '/users/new' do

  erb :'users/new' #show new users view

end

# create a new user
post '/users' do

  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user

  if @user.save #saves new user or returns false if unsuccessful
    redirect '/users' #redirect back to users index page
  else
    erb :'users/new' # show new users view again(potentially displaying errors)
  end

end
