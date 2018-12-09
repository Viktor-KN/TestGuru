class AddReferencesToSomeTables < ActiveRecord::Migration[5.2]
  def change
    change_table :tests do |t|
      t.references :category
    end

    change_table :questions do |t|
      t.references :test
    end

    change_table :answers do |t|
      t.references :question
    end
  end
end
