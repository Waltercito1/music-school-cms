class RenameInstructorIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :instructor_id, :user_id
  end
end
