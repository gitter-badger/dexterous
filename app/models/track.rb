class Track < ActiveRecord::Base

  extend FriendlyId

  resourcify
  has_paper_trail
  friendly_id :title, use: :slugged

  # visibility:
  # ----------
  #   open       => Is visible to all users, guests and search engines
  #   public     => Is visibile to any signed in users
  #   private    => Is visible to contributors only
  as_enum visibility: %i[public private open], prefix: true

  has_many :permissions
  has_many :milestones
  has_many :achievements, through: :milestones
  has_many :achievers, through: :achievements, source: :user
  has_many :learning_resources
  has_many :topics, as: :subject

  validates :title, presence: true

  def self.contributed_by user
    Track.with_role :contributor, user
  end

  def self.enrolled_by user
    Track.with_role :enrollee, user
  end

  def contributors
    User.with_role :contributor, self
  end

  def enrollees
    User.with_role :enrollee, self
  end
  alias_method :enrolled_users, :enrollees

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
#  id            :integer          not null, primary key
#  title         :string           not null
#  slug          :string           not null
#  description   :text
#  visibility_cd :integer          default(0), not null
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_tracks_on_slug                    (slug) UNIQUE
#  index_tracks_on_visibility_cd_and_slug  (visibility_cd,slug)
#
