class CreateTables < ActiveRecord::Migration
  def change
    
    # -- Users --------------------------------------------------------------
    
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :first_name, :null => false, :default => ""
      t.string :last_name, :null => false, :default => ""
      t.string :username, :null => false, :default => ""
      t.integer :age
    end

    add_index :users, :email,                :unique => true
    add_index :users, :username,             :unique => true
   
    
  end
end

