# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence(:id){ |n| n }
    caption "Test Caption"
    description "Test Text"
    user {FactoryGirl.build(:user)}
  end
end
