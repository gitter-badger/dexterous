# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achievement do
  end
end

# == Schema Information
#
# Table name: achievements
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  milestone_id :integer          not null
#  duration     :integer
#  score        :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_achievements_on_milestone_id  (milestone_id)
#  index_achievements_on_user_id       (user_id)
#
