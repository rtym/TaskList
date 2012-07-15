# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:id){ |n| n }
    name "John"
    surname "Smith"
    sequence(:email){ |n| %Q{john#{n}_smith@test.com} }
    password "test"
    password_confirmation "test"
  end
end
