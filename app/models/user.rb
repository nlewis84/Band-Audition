class User < ApplicationRecord
    has_many :audition_users
    has_many :auditions, through: :audition_users
    has_secure_password
end
