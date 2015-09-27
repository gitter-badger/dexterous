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
#  user_id      :integer          not null
#  track_id     :integer          not null
#  completed_at :datetime
#
# Indexes
#
#  index_enrollments_on_track_id              (track_id)
#  index_enrollments_on_user_id_and_track_id  (user_id,track_id)
#
