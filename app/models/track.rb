class Track < ActiveRecord::Base

  has_paper_trail

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
  validates :visibility, inclusion: {
    in: %w{public open private}
  }

  validates :title, presence: true

  def achievements_for(user)
    achievements.where(user: user)
  end

  scope :contributed_by, -> (user) do
    joins(:contributors).where(contributors: { user_id: user.id })
  end

  scope :enrolled_by, -> (user) do
    joins(:enrollments).where(enrollments: { user_id: user.id })
  end

end

# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  title       :string
#  slug        :string
#  description :text
#  visibility  :string
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_tracks_on_slug                 (slug) UNIQUE
#  index_tracks_on_visibility_and_slug  (visibility,slug)
#
