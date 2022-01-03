require 'faker'

FactoryBot.define do
  factory :task do
    user_id { 1 }
    title { Faker::Name.unique.name }
    description { 'default' }
    completed { false }
    deadline { Time.now + 1.day }
    subject { FactoryBot.create(:subject) }
  end
end