class AddUniqueIndexToTestsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, %i[level title]
  end
end
