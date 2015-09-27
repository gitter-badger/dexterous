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
#  user_id      :integer          not null
#  track_id     :integer          not null
#  completed_at :datetime
#
# Indexes
#
#  index_enrollments_on_track_id              (track_id)
#  index_enrollments_on_user_id_and_track_id  (user_id,track_id)
#
