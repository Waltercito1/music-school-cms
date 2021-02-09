class AddInstructorIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :instructor_id, :integer
  end
end
