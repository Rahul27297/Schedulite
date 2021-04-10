class AddCourseNameToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :course_name, :string
  end
end
