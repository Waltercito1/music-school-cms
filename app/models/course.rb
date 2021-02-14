class Course < ActiveRecord::Base
    belongs_to :user 
    #belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
    validates :name, :description, :category, :level, :semester, presence: true
    validates :name, uniqueness: true
end
