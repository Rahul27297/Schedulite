class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_digest
    end
    add_index :users, :username, unique: true
  end
  def down
    drop_table :users
 end  
end
