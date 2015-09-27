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
#  track_id          :integer          not null
#  title             :string           not null
#  slug              :string           not null
#  description       :text
#  expected_duration :integer
#  score             :integer
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_milestones_on_slug               (slug) UNIQUE
#  index_milestones_on_track_id_and_slug  (track_id,slug)
#
