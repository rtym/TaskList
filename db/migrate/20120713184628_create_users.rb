class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :surname, :null => false
      t.string :email, :null => false
      t.string :password_hash, :length => 60
      t.string :password_salt, :length => 29

      t.timestamps
    end
  end
end
