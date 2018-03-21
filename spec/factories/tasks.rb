FactoryBot.define do
  factory :task do
    task_name { Faker::Lorem.characters(25) }
    task_type true
    user { FactoryBot.create(:user) }
  end

  factory :public_task, parent: :task do
    task_type false
  end
end
