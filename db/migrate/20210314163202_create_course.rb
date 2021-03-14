class CreateCourse < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :course_num
      t.string :dept
      t.string :course_name
      t.string :professor
      t.string :requirement
      t.string :course_time
      t.timestamps
    end
  end
 def down
    drop_table :courses
 end
end
