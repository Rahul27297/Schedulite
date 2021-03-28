class CreateCourseFaqs < ActiveRecord::Migration
  def change
    create_table :course_faqs do |t|
      t.integer :number
      t.text :question
      t.string :course_number

      t.timestamps null: false
    end
  end
end
