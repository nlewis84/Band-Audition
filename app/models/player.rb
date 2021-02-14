class Player < ApplicationRecord
  belongs_to :audition
  belongs_to :instrument

  validates :first_name, :last_name, presence: true

  scope :belonging_to_current_audition, -> (audition) { where('audition_id = ?', audition)}

end
