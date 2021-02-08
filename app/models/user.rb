class User < ActiveRecord::Base
    has_many :courses
    has_many :userCourses
    has_secure_password
    validates :password, length: {in: 6..50}, confirmation: true
    validates :username, uniqueness: true, length: {in: 5..30}, exclusion: {in: ["admin", "superadmin", "user"]}
end
