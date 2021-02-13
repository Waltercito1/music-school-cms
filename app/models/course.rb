class Course < ActiveRecord::Base
    belongs_to :instructor, class_name: "User", foreign_key: "teacher_id"
    validates :name, :description, :category, :level, :semester, presence: true
end
