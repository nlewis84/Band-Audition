class Instrument < ApplicationRecord
  has_many :players
  has_many :audition_instruments
  has_many :auditions, through: :audition_instruments

  accepts_nested_attributes_for :audition_instruments,
    allow_destroy: true,
    :reject_if => proc { |att| att[:priority].blank? }

  def remaining_spots
    @players = self.players.count
    self.available_spots - @players
  end

  def priority
    self.audition_instruments.first.priority
  end

end
