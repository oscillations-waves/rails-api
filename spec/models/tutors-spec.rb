require 'rails_helper'

# Test suite for the Item model
RSpec.describe Tutor, type: :model do
  # Association test
  # ensure an course record belongs to a single tutor record
  it { should belong_to(:course) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:tutor_name) }
end