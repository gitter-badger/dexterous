class TrackPolicy < ApplicationPolicy

  def track
    record
  end

  def show?
    track.visibility_public? || track.enrolled_in?(record) || track.is_contributed_by?(user)
  end

  def update?
    track.is_contributed_by?(user)
  end

  def create?
    true
  end

  def destroy?
  end

end
