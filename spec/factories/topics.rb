# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    subscription "MyString"
    update "MyString"
  end
end

# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  subject_id   :integer
#  subject_type :integer
#  created_at   :datetime
#  updated_at   :datetime
#
