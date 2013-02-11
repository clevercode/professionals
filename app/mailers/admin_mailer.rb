class AdminMailer < ActionMailer::Base
  default from: "Questions <questions@drdannicoll.com>"

  def question_email(question)
    @question = question
    mail(
      to: 'contact@drdannicoll.com',
      from: "#{@question.name} <#{@question.email}>",
      subject: 'Question for Dr. Nicoll'
    )
  end
end
