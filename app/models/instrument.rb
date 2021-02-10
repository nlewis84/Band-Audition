class Instrument < ApplicationRecord
  has_many :players
  belongs_to :audition

  def remaining_spots
    @players = self.players.count
    self.available_spots - @players
  end
end
