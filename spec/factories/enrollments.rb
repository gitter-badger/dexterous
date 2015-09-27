# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :enrollment do
  end
end

# == Schema Information
#
# Table name: enrollments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  track_id     :integer
#  enrolled_at  :datetime
#  completed_at :datetime
#
