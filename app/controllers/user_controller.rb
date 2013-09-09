before do
  unless logged? || request.path == '/' || request.path == '/signup' || request.path == '/login'
    redirect '/'
  end
end

get '/' do
  redirect '/user_profile' if logged? 
  @msg = params[:msg]

  erb :index
end

post '/signup' do

  this_user = User.new(email: params[:email])
  this_user.password = (params[:password])
  if this_user.save
    session[:user_id] = this_user.id
    redirect '/user_profile'
    erb :index
  else
    @errors = this_user.errors.full_messages
    erb :index
  end

end

post '/login' do
  current_id = User.authenticate(params[:login_email],params[:login_password])
  p "current is: #{current_id}"

  if current_id
    session[:user_id] = current_id
    redirect '/user_profile'
  else
  @message = "incorrect username or password"
  redirect "/?msg=#{@message}"
end

end

get '/logout' do
  session.clear
  redirect '/'
end


