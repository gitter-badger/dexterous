# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    title "Rails 4.0 (prime stack)"
    description "Learn how to develop cutting edge rails applications following TDD approach"
    owner factory: :user
    visibility 'open'
    contributability 'public'
  end
end

# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  visibility  :string
#  created_at  :datetime
#  updated_at  :datetime
#
