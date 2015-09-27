# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :learning_resource do
    title 'rails guides'
    track factory: :track
    owner factory: :user
    url 'example.com'
  end
end

# == Schema Information
#
# Table name: learning_resources
#
#  id           :integer          not null, primary key
#  url          :string
#  title        :string           not null
#  slug         :string           not null
#  milestone_id :integer
#  track_id     :integer          not null
#  description  :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_learning_resources_on_milestone_id_and_slug  (milestone_id,slug)
#  index_learning_resources_on_slug                   (slug) UNIQUE
#  index_learning_resources_on_track_id_and_slug      (track_id,slug)
#
