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
#  id            :integer          not null, primary key
#  title         :string           not null
#  slug          :string           not null
#  description   :text
#  visibility_cd :integer          default(0), not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_tracks_on_slug                    (slug) UNIQUE
#  index_tracks_on_visibility_cd_and_slug  (visibility_cd,slug)
#
