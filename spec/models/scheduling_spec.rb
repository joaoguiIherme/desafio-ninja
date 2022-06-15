require 'rails_helper'

RSpec.describe Scheduling, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:room) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
    it { is_expected.to allow_value('25-07-2022 20:23').for(:start_time) }
    it { is_expected.to allow_value('26-08-2022 08:45').for(:end_time) }
    it { is_expected.not_to allow_value('44-07-2022 25:23').for(:start_time) }
    it { is_expected.not_to allow_value('55-08-2022 40:45').for(:end_time) }
  end
end
