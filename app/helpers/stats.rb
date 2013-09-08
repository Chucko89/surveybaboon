helpers do

  def user_surveys
    Survey.where(user_id: session[:user_id])
  end

  def choices_for_questions(q)
    question = Question.find(q.id)
    question.choices
  end

  def selection_amount(c)
    choice = Choice.find(c.id)
    get_stats = choice.selections
    get_stats.length
  end

end  