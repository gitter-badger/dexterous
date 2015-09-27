# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :milestone do
  end
end

# == Schema Information
#
# Table name: milestones
#
#  id                :integer          not null, primary key
#  owner_id          :integer
#  track_id          :integer
#  title             :string
#  description       :text
#  expected_duration :integer
#  score             :integer
#  created_at        :datetime
#  updated_at        :datetime
#
