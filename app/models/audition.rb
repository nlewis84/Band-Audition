class Audition < ApplicationRecord
    has_many :audition_users
    has_many :users, through: :audition_users
    has_many :players
    has_many :instruments, through: :players

    
    before_save do
        string_length = 6
        self.code = rand(36**string_length).to_s(36)
    end
    
end
