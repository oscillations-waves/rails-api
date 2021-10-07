require 'rails_helper'

# Test suite for the Course model
RSpec.describe Course, type: :model do
  # Association test
  # ensure Course model has a 1:m relationship with the Tutor model
  it { should have_many(:tutors).dependent(:destroy) }
  # Validation tests
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end