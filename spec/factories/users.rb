FactoryBot.define do
  factory :user do
    email { "john#{rand(1..60)}@email.com" }
    password { 'SecretPassword123' }
  end
end
