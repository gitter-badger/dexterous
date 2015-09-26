class Track < ActiveRecord::Base

  include Authority::Abilities

  belongs_to :owner, class_name: 'User'
  has_many :permissions
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
    in: %w{public open restricted private}
  }

  validates :owner_id, :title, presence: true

  def milestones_for(user)
    return nil unless viewable_by? user
    milestones(include: {
      milestones: {
        include: [{
          achievements: {
            where: { user_id: user.id }
          }
        }, :learning_resources]
      }
    }).map do |m|
      m.serializable_hash(include:
        [{
          achievements: {
            where: {user_id: user.id}
          }
        }, :learning_resources])
        .merge(
          editable: m.editable_by?(user),
          deletable: m.deletable_by?(user)
        )
    end
  end

  def learning_resources_for(user)
    return nil unless viewable_by? user
    merge_permissions_for learning_resources, user
  end

  def achievements_for(user)
    achievements.where(user: user)
  end

  private

  def merge_permissions_for(models, user)
    models.map do |m|
      m.serializable_hash.merge(
        editable: m.editable_by?(user),
        deletable: m.deletable_by?(user)
      )
    end
  end

end
