class AuditionInstrument < ApplicationRecord
  belongs_to :audition
  belongs_to :instrument
end
