require 'pry'

get '/user_profile' do
  @surveys = Survey.all
  @created_surveys = user_surveys
  
  erb :profile
end

get '/create_survey' do

  erb :create_survey  
end

post '/create_survey' do

  survey = Survey.new(title: params[:survey][":title"], user_id: session[:user_id])
  survey.save

  params[:question].first.each_with_index do |prompt_array, index|
    question = Question.new(prompt: prompt_array[1], survey_id: survey.id)
    if question.save
      params[:choice][(index + 1).to_s].each do |option_array|
        choice = Choice.new(option: option_array[1], question_id: question.id)
        choice.save
      end
    else
      "ERROR SAVING QUESTION"
    end
  end
  redirect "/user_profile"
end

get '/survey/create_question' do

  @question_count = params[:question_count]

  erb :_create_question, layout: false
end

get '/survey/question/create_choice' do
  @choice_count = params[:choice_count]
  @question_count = params[:question_count]

  erb :_create_choice, layout: false
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

