class User < ActiveRecord::Base
    has_many :courses
    has_many :userCourses
    has_secure_password
    validates :password, length: {in: 6..50} , confirmation: true
    validates :user_name, uniqueness: true, length: {in: 5..30}, exclusion: {in: ["admin", "superadmin", "user"]}
    validates :email_address, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
end
