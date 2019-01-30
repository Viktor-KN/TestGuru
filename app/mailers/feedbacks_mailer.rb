class FeedbacksMailer < ApplicationMailer
  def self.send_received_feedback(feedback)
    recipients = Admin.all.pluck(:email)
    recipients.each { |recipient| received_feedback(recipient, feedback).deliver_now }
  end

  def received_feedback(recipient, feedback)
    @feedback = feedback
    mail to: recipient, subject: 'Получено новое сообщение через форму обратной связи'
  end
end
