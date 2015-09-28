class TrackPolicy < ApplicationPolicy

  def track
    record
  end

  def show?
    track.public? || user.has_role?([:enrollee, :contributor], track)
  end

  def update?
    user.has_role? :contributor, track
  end

  def create?
    true
  end

  def destroy?
    user.has_role? :contributor, track
  end

end
