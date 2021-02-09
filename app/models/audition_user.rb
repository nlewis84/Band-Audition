class AuditionUser < ApplicationRecord
  belongs_to :user
  belongs_to :audition
end
