class AddResultToTestPassages < ActiveRecord::Migration[5.2]
  def up
    add_column :test_passages, :result, :integer, default: :null

    TestPassage.all.each do |test_passage|
      test_passage.update_columns(result: test_passage.calc_result_percent) if test_passage.completed?
    end
  end

  def down
    remove_column :test_passages, :result
  end
end
