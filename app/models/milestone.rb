class Milestone < ActiveRecord::Base

    include Authority::Abilities
    self.authorizer_name = "TrackItemAuthorizer"

    belongs_to :track
    has_many :learning_resources
    has_many :achievements
    has_many :achievers, through: :achievements, source: :user

    validates :track_id, presence: true
end

# == Schema Information
#
# Table name: milestones
#
#  id                :integer          not null, primary key
#  track_id          :integer
#  title             :string
#  description       :text
#  expected_duration :integer
#  score             :integer
#  created_at        :datetime
#  updated_at        :datetime
#
