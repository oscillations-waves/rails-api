class Course < ApplicationRecord
  has_many :tutors

  # validations
  validates_presence_of :name
end
