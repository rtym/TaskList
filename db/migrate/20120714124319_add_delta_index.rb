class AddDeltaIndex < ActiveRecord::Migration
  def up
    add_column :users, :delta, :boolean, :default => true, :null => false
  end

  def down
    remove_column :users, :delta, :boolean, :default => true, :null => false
  end
end
