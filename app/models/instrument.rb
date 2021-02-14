class Instrument < ApplicationRecord
  has_many :players
  has_many :audition_instruments
  has_many :auditions, through: :audition_instruments

  validates :name, presence: true

  accepts_nested_attributes_for :audition_instruments,
    allow_destroy: true,
    :reject_if => proc { |att| att[:priority].blank? }

  def remaining_spots
    if self.limited_spots
      @players = self.players.count
      self.available_spots - @players
    end
  end

  def limited_spots
    !!self.available_spots
  end

  def priority
    self.audition_instruments.first.priority
  end

end
