class AddUniqueIndexToTestsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, %i[title level]
  end
end
