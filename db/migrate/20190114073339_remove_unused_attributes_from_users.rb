class RemoveUnusedAttributesFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :name
    remove_column :users, :admin
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
