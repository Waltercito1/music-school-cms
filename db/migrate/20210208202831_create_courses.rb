class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :level
      t.string :semester
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
