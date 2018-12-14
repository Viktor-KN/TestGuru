class AddEmailAttributeToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
  end
end
