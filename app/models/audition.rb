class Audition < ApplicationRecord
    has_many :audition_users
    has_many :users, through: :audition_users
    has_many :audition_instruments
    has_many :instruments, through: :audition_instruments
    has_many :players

    validates :school, presence: true
    validates :date, presence: true
        
    accepts_nested_attributes_for :instruments,
        allow_destroy: true,
        :reject_if => proc { |att| att[:name].blank? || att[:available_spots].blank? }
    
    before_save do
        string_length = 6
        self.code = rand(36**string_length).to_s(36)
    end
    
    def school_with_year
        "#{self.school} - #{self.date.strftime("%Y")}"
    end

end
