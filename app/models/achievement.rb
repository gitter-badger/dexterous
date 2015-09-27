# Currently denotes completion of milestone -
# may be expanded in future as the system becomes more gamified
#
class Achievement < ActiveRecord::Base

  belongs_to :enrollment
  has_one :user, through: :enrollment
  belongs_to :milestone

  validates :enrollment_id, :milestone_id, presence: true

end

# == Schema Information
#
# Table name: achievements
#
#  id            :integer          not null, primary key
#  enrollment_id :integer
#  milestone_id  :integer
#  duration      :integer
#  score         :integer
#  created_at    :datetime
#  updated_at    :datetime
#
