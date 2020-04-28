# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  # Configuration for send mails in heroku
  ActionMailer::Base.smtp_settings = {
    port: ENV['MAILGUN_SMTP_PORT'],
    address: ENV['MAILGUN_SMTP_SERVER'],
    user_name: ENV['MAILGUN_SMTP_LOGIN'],
    password: ENV['MAILGUN_SMTP_PASSWORD'],
    domain: 'kmbios-ve-api-v1.herokuapp.com',
    authentication: :plain
  }
  ActionMailer::Base.delivery_method = :smtp

  default from: 'from@example.com'
  layout 'mailer'
end
