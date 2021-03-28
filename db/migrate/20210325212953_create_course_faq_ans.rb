class CreateCourseFaqAns < ActiveRecord::Migration
  def change
    create_table :course_faq_ans do |t|
      t.integer :question_number
      t.text :answer
      t.string :course_number

      t.timestamps null: false
    end
  end
end
