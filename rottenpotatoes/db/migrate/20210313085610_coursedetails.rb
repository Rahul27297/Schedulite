class Coursedetails < ActiveRecord::Migration
  def up
    create_table :classdetails do |t1|
      t1.string :number
      t1.string :detail
    end
  end    
  def down
    drop_table :movies
    drop_table :classdetails
  end
end
