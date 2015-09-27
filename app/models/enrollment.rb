class Enrollment < ActiveRecord::Base

  belongs_to :user
  belongs_to :track
  has_many :achievements

  has_paper_trail

  validates :user_id, :track_id, presence: true

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
