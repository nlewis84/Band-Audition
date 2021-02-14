class User < ApplicationRecord
    has_many :audition_users
    has_many :auditions, through: :audition_users

    has_secure_password	

    validates :username, uniqueness: true, presence: true

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth['info']['email']) do |u|
            u.name = auth['info']['name']
            u.password = SecureRandom.hex
        end
    end
end
