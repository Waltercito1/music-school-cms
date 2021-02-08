class Course < ActiveRecord::Base
    belongs_to :instructor, class_name: "User"
    validates :name, :description, :level, :term, presence: true
end
