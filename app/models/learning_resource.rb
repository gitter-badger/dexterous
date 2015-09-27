class LearningResource < ActiveRecord::Base

  belongs_to :milestone
  belongs_to :track
  belongs_to :owner, class_name: 'User'

  has_paper_trail

  validates :track_id, :title, presence: true
  validates :url, format: {
              with: /\A(https?|ftp):\/\/(www\d?|[a-zA-Z0-9]+)?\.[a-zA-Z0-9-]+(\:|\.)([a-zA-Z0-9.]+|(\d+)?)([\/?:].*)?\z/
            }
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
