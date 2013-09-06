get '/user_profile' do
  
  erb :profile
end

get '/create_survey' do

  erb :_create_survey  
end

post '/create_survey' do
  survey = Survey.new(title: params[:title], user_id: 1)

  if survey.save
    session[:survey_id] = survey.id
    redirect "/survey/create_questions"
  else
    "BLAHBLAHB LAH ERROR /create_survey"
  end
end

get '/survey/create_questions' do

  erb :_create_question
end

post '/survey/create_question' do
  question = Question.new(prompt: params[:prompt], survey_id: session[:survey_id])

  if question.save
    session[:question_id] = question.id
    redirect "/survey/question/create_choices"
  else
    "ERROR /survey/create_question"
  end
end

get '/survey/question/create_choices' do
  # show the question that these choices are being created for, better
  # user experience.
  erb :_create_choice
end

post '/survey/question/create_choices' do
  choice1 = Choice.new(option: params[:choice1], question_id: session[:question_id])
  choice2 = Choice.new(option: params[:choice2], question_id: session[:question_id])

  if choice1.save && choice2.save
    redirect "/survey/create_questions"
  else
    "ERROR: A choice didn't save"
  end
end


# get '/my_surveys' do

#   erb :
# end  