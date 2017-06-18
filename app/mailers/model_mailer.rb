class ModelMailer < ApplicationMailer

  default from: "ddomercq@bidpalnetwork.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.email_sender.subject
  #
  def email_sender
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
