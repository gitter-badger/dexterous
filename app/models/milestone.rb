class Milestone < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = "TrackItemAuthorizer"

  belongs_to :track
  belongs_to :owner, class_name: 'User'

end