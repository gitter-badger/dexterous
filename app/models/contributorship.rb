class Contributorship < ActiveRecord::Base

  belongs_to :user
  belongs_to :track

  has_paper_trail

  validates :user_id, :track_id, presence: true
  validates :can_view,
            inclusion: { in: [true]},
            if: Proc.new {|p| p.can_edit }
  validates :can_edit,
            inclusion: { in: [true]},
            if: Proc.new {|p| p.can_manage }

end

# == Schema Information
#
# Table name: contributorships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  can_view   :boolean          default(FALSE), not null
#  can_edit   :boolean          default(FALSE), not null
#  can_manage :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_contributorships_on_user_id_and_track_id  (user_id,track_id)
#
