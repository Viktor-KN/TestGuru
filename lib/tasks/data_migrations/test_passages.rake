namespace :test_passages do
  desc "Update test passages result value, after schema migration"
  task set_result: :environment do
    test_passages = TestPassage.where(current_question_id: nil)
    puts "Going to update #{test_passages.count} test passages"

    ActiveRecord::Base.transaction do
      test_passages.each do |test_passage|
        test_passage.update_columns(result: test_passage.calc_result_percent)
        print "."
      end
    end

    puts " All done now!"
  end
end
