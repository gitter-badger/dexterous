class Track < ActiveRecord::Base

  extend FriendlyId

  has_paper_trail
  friendly_id :title, use: :slugged

  has_many :permissions
  has_many :contributorships
  has_many :contributors, through: :contributorships, source: :user
  has_many :enrollments
  has_many :enrolled_users, through: :enrollments, source: :user
  has_many :milestones
  has_many :achievements, through: :milestones
  has_many :achievers, through: :achievements, source: :user
  has_many :learning_resources
  has_many :topics, as: :subject

  # visibility:
  # ----------
  #   open       => Is visible to all users, guests and search engines
  #   public     => Is visibile to any signed in users
  #   private    => Is visible to contributors only
  as_enum visibility: %i[public private open], prefix: true

  validates :title, presence: true

  scope :contributed_by, -> (user) do
    joins(:contributorships).where(contributorships: { user_id: user.id })
  end

  scope :enrolled_by, -> (user) do
    joins(:enrollments).where(enrollments: { user_id: user.id })
  end

  def achievements_for(user)
    achievements.where(user: user)
  end

  def is_contributed_by? user
    contributorships.where(user_id: user.id).present?
  end

end

# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  slug        :string           not null
#  description :text
#  visibility  :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_tracks_on_slug                 (slug) UNIQUE
#  index_tracks_on_visibility_and_slug  (visibility,slug)
#
