class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show result update gist]

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      check_for_new_badges
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question, url: result.html_url, user: @test_passage.user)
      flash[:notice_html] = t('.success', link: view_context.link_to('Gist', result.html_url))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage_path(@test_passage)
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_for_new_badges
    result = BadgeAssignmentService.new(@test_passage).call
    unless result.empty?
      earned_badges = result.map { |earned_badge| earned_badge.badge.name }.join(', ')
      flash[:notice] = t('badges.new_badges_earned', badges: earned_badges)
    end
  end
end
