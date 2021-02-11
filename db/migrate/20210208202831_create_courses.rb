class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :level, default:0
      t.integer :term, default:0
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
