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
#  title        :string
#  milestone_id :integer
#  track_id     :integer
#  owner_id     :integer
#  description  :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#
