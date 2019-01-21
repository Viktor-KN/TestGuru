class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true, null: false
      t.string :hash_string, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
