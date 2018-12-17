class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new; end

  def create
    question = @test.questions.create(question_params)
    redirect_to question if question.save
  end

  def destroy
    test_id = @question.test_id
    @question.destroy
    redirect_to test_questions_path(test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render inline: '<h2>Question not found</h2>'
  end
end
