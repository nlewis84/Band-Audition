class Audition < ApplicationRecord
    has_many :audition_users
    has_many :users, through: :audition_users
    has_many :audition_instruments
    has_many :instruments, through: :audition_instruments
    has_many :players

    
    before_save do
        string_length = 6
        self.code = rand(36**string_length).to_s(36)
    end
    
    def school_with_year
        "#{self.school} - #{self.year.strftime("%Y")}"
    end

end
