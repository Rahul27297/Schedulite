class CreateCoursedetails < ActiveRecord::Migration
  def up
    create_table :coursedetails do |t|
      t.string :number
      t.string :points
      t.string :coursetype
      t.string :method_of_inst
      t.string :detail
    end
  end
 def down
    drop_table :coursedetails
 end
end
