helpers do

  def user_surveys
    Survey.where(user_id: session[:user_id])
  end

end  