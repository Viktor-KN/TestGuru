class BadgeAssignmentService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    return [] unless @test_passage.result_success?

    Badge.all.select { |badge| send "#{badge.check_type}?", badge.param }
  end

  private

  def category_completed?(category_id)
    category_id = category_id.to_i
    @test.category_id == category_id.to_i &&
      Test.by_category_id(category_id).order(:id).ids == @user.tests.successful.by_category_id(category_id).order(:id).distinct.ids
  end

  def max_tries_completed?(tries_count)
    @user.tests.by_id(@test.id).count <= tries_count.to_i
  end

  def level_completed?(level)
    level = level.to_i
    @test.level == level && Test.by_level(level).order(:id).ids == @user.tests.successful.by_level(level).order(:id).distinct.ids
  end
end
