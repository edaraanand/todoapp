FactoryBot.define do
  factory :user do
    email { [Faker::Name.first_name, "@avenue.com"].join }
    password "password"
  end
end
