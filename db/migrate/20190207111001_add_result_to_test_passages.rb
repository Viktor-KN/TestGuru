class AddResultToTestPassages < ActiveRecord::Migration[5.2]
  def up
    add_column :test_passages, :result, :integer, default: :null

    puts "Please, complete data migration by running task: rake test_passages:set_result"
  end

  def down
    remove_column :test_passages, :result
  end
end
