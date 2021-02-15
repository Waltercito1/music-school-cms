class Course < ActiveRecord::Base
    belongs_to :user 
    validates :name, :description, :category, :level, :semester, presence: true
    validates :name, uniqueness: true
end
