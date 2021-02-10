class Instrument < ApplicationRecord
  has_many :players
  has_many :audition_instruments
  has_many :auditions, through: :audition_instruments

  def remaining_spots
    @players = self.players.count
    self.available_spots - @players
  end
end
