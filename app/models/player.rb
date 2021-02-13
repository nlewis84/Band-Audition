class Player < ApplicationRecord
  belongs_to :audition
  belongs_to :instrument

  scope :belonging_to_current_audition, -> (audition) { where('audition_id = ?', audition)}

end
