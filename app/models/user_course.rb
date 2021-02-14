class UserCourse < ActiveRecord::Base
    belongs_to :user
    belongs_to :course
    #validates :enroll_status, presence: true
end
