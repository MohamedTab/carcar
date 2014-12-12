class LearnerMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.learner_mailer.welcome.subject
  #
  def welcome(learner)
    @learner = learner

    mail to: @learner.email
  end

    def booking_confirmation(learner)
    @learner = learner

    mail to: @learner.email
  end
end
