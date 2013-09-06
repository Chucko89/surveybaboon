
get '/' do
  @message = "arriving from get '/' "
  erb :index
end

post '/signup' do
  begin
  this_user = User.new(email: params[:email])
  this_user.password =  params[:password]
  this_user.save!
  session[:user_id] = this_user.id
  redirect '/user_profile'
  rescue Exception => e
    @message = e.message
    erb :index
  end

end

post '/login' do
  current_id = User.authenticate(params[:email],params[:password])
  
  if current_id
    session[:user_id] = current_id
    redirect '/user_profile'
  else
  @message = "incorrect username or password"
  erb :index
end

end

get '/logout' do
  session.clear
  redirect '/'
end


