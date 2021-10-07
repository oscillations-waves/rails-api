class Tutor < ApplicationRecord
  belongs_to :course
  # validation
  validates_presence_of :tutor_name
end
