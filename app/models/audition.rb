class Audition < ApplicationRecord
    has_many :audition_users
    has_many :users, through: :audition_users
    has_many :players
    has_many :instruments, through: :players
end
