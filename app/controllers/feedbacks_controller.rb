class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid? && recaptcha_valid?
      FeedbacksMailer.send_received_feedback(@feedback)
      redirect_to :root, notice: t('feedbacks.feedback_sent')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

  def recaptcha_valid?
    verify_recaptcha(model: @feedback)
  end
end
