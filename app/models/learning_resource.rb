class LearningResource < ActiveRecord::Base

  extend FriendlyId

  belongs_to :milestone
  belongs_to :track
  belongs_to :owner, class_name: 'User'

  has_paper_trail
  friendly_id :title, use: :slugged

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
#  title        :string           not null
#  slug         :string           not null
#  milestone_id :integer
#  track_id     :integer          not null
#  description  :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_learning_resources_on_milestone_id_and_slug  (milestone_id,slug)
#  index_learning_resources_on_slug                   (slug) UNIQUE
#  index_learning_resources_on_track_id_and_slug      (track_id,slug)
#
