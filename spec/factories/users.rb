# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "user#{i}@mail.com"}
    sequence(:name) {|i| "user#{i}"}
    password "password"
  end
end
