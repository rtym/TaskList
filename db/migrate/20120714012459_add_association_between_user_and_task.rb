class AddAssociationBetweenUserAndTask < ActiveRecord::Migration
  def up
    add_column :tasks, :user_id, :integer
    add_index :tasks, :user_id
  end

  def down
    remove_column :tasks, :user_id
  end
end
