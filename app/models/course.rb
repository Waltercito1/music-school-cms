class Course < ActiveRecord::Base
    belongs_to :user 
    #validates :name, :description, :category, :level, :semester, presence: true
    validates :name, :description, presence: true
    validates :name, uniqueness: true
    validates :category, :level, :semester, presence: true, exclusion: { in: %w(Choose...), 
    message: "%{value} is not valid. Please use the dropdown menu to pick one." }
end
