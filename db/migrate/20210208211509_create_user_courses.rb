class CreateUserCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :enroll_status, default:0

      t.timestamps null: false
    end
  end
end
