require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:schedulings) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_numericality_of(:number).only_integer }
    it { is_expected.to validate_uniqueness_of(:number) }
  end
end
