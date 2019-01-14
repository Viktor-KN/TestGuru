class AddTypeToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, null: false, default: 'User', index: true
  end
end
