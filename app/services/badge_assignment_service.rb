class BadgeAssignmentService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    earned_badges = []

    # Это условие может помешать тем бэйджам, что основаны на неудачах, но пока все существующие бэйджи основаны на
    # успешном прохождении теста и это здесь уместно. Иначе это условие надо будет продублировать во все проверки, где
    # требуется успешное прохождение теста.
    if @test_passage.result_success?
      Badge.all.each do |badge|
        # Чтобы выключить странное требование "Пользователь может получать один и тот же бэйдж более одного раза"
        # next if user.earned_badges.find_by(badge: badge)

        earned_badges << EarnedBadge.create!(badge: badge, user: @user) if earned_badge?(badge)
      end
    end
    earned_badges
  end

  private

  def earned_badge?(badge)
    send badge.check_type, badge.param
  end

  def category_completed(category_id)
    category_id = category_id.to_i
    @test.category_id == category_id.to_i &&
      Test.by_category_id(category_id).ids.sort == @user.tests.successful.by_category_id(category_id).distinct.ids.sort
  end

  def max_tries_count(tries_count)
    @user.tests.by_id(@test.id).count <= tries_count.to_i
  end

  def level_completed(level)
    level = level.to_i
    @test.level == level && Test.by_level(level).ids.sort == @user.tests.by_level(level).distinct.ids.sort
  end
end
