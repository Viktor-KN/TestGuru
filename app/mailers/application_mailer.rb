class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <do-not-reply@mailgun.prorust.ru>)
  layout 'mailer'
end
