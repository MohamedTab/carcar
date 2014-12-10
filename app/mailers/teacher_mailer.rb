class TeacherMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teacher_mailer.welcome.subject
  #
  def welcome(teacher)
    @teacher = teacher

    mail to: @teacher.email
  end
end
