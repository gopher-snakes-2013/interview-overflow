module ApplicationHelper
  def upvote
    vote_button
  end

  def donwvote
    vote_button(-1)
  end

  def vote_button(value=1)
    button_to(value, question_path(question, :value => value), method: 'put', class: 'plus1')
  end
end
