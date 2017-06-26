class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.mail.subject
  #
  default from: "info@jawhar.us"

  def mail_to(user_email)
    mail to: user_email, subject: "شكراً لانضمامكم إلى جوهر"
  end
end