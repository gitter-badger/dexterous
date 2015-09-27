# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achievement do
  end
end

# == Schema Information
#
# Table name: achievements
#
#  id            :integer          not null, primary key
#  enrollment_id :integer
#  milestone_id  :integer
#  duration      :integer
#  score         :integer
#  created_at    :datetime
#  updated_at    :datetime
#
