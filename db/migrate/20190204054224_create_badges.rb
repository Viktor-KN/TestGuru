class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image_url, null: false
      t.integer :check_type, null: false
      t.string :param, null: false
      t.index %i[check_type param]

      t.timestamps
    end
  end
end
