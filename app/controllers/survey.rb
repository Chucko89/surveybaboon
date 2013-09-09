require 'pry'


get '/user_profile' do
  @surveys = Survey.all
  @created_surveys = user_surveys
  
  erb :profile
end

get '/create_survey' do
@survey_errors = params[:msg]
  erb :create_survey  
end

post '/create_survey' do
  survey = Survey.new(title: params[:survey][":title"], user_id: session[:user_id])
   
   if !survey.save 
    redirect "/create_survey?msg=#{survey.errors.full_messages.first}"
  end

  params[:question].first.each_with_index do |prompt_array, index|
    question = Question.new(prompt: prompt_array[1], survey_id: survey.id)
    if question.save
      params[:choice][(index + 1).to_s].each do |option_array|
        choice = Choice.new(option: option_array[1], question_id: question.id)
        redirect "create_survey?msg=#{choice.errors.full_messages.first}" if !choice.save
      end
    else
      redirect "create_survey?msg=#{question.errors.full_messages.first}"
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

get '/created_surveys/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  
  erb :_survey_stats, :layout => false
end
