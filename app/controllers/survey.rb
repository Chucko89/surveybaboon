['/user_profile', '/create_survey', '/survey/*'].each do |path|
  before path do
    redirect '/' unless logged?
  end
end

get '/user_profile' do
  @surveys = Survey.all
  
  erb :profile
end

get '/create_survey' do

  erb :_create_survey  
end

post '/create_survey' do
  survey = Survey.new(title: params[:title], user_id: current_user.id)

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

get '/survey/take_survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions

  erb :_take_survey
end

post '/survey/submit/:survey_id' do
  # ABLE TO SELECT MULTIPLE RADIO BUTTONS
  params[:choice].each do |k, v|
    selection = Selection.new(user_id: current_user.id, choice_id: v)
    unless selection.save
      "ERROR"
    end
  end
  
  redirect "/user_profile"

end

