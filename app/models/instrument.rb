class Instrument < ApplicationRecord
  has_many :players
  belongs_to :audition
end
