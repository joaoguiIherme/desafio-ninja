FactoryBot.define do
  factory :scheduling do
    user { create(:user) }
    room { create(:room) }
    start_time { '15-08-2023 14:10' }
    end_time { '15-08-2023 17:45' }
  end
end
