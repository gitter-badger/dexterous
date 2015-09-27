class Contributor < ActiveRecord::Base

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
# Table name: contributors
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  track_id   :integer
#  can_view   :boolean
#  can_edit   :boolean
#  can_manage :boolean
#  created_at :datetime
#  updated_at :datetime
#
