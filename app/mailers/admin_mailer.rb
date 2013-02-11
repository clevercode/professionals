class AdminMailer < ActionMailer::Base
  default from: "questions@drdannicoll.com"

  def question_email(question)
    @question = question
    mail to: 'contact@drdannicoll.com', subject: 'You\'ve just been asked a question.'
  end
end
