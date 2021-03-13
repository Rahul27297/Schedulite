class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :course_num
      t.string :dept
      t.string :course_name
      t.string :professor
      t.string :requirement
      t.string :course_time
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
      # t.string :director
    end
  end

  def down
    drop_table :movies
    drop_table :classdetails
  end
end
