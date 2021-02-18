class Player < ApplicationRecord
  belongs_to :audition
  belongs_to :instrument

  validates :first_name, :last_name, presence: true

  # build a scope that returns audition with the most players
  scope :belonging_to_current_audition, -> (audition) { where('audition_id = ?', audition)}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def affirmative
    self.virtual ? "Yes" : "No"
  end

  def school
    self.audition.school
  end
end
