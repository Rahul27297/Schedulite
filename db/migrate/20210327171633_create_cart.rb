class CreateCart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :user_id
      t.string :course_number
      t.string :course_time
    end
  end
  def down
    drop_table :courses
  end  
end
