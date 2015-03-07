FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@mail.com"}
    sequence(:username) { |n| "user#{n}"}
    password '123456789'
  end
end
