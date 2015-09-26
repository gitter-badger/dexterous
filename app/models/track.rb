class Track < ActiveRecord::Base

  has_many :permissions
  has_many :contributors
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

  validates :owner_id, :title, presence: true

  def achievements_for(user)
    achievements.where(user: user)
  end

end
