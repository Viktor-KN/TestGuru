class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title, limit: 50
      t.integer :level
      t.integer :category_id

      t.timestamps
    end
  end
end
