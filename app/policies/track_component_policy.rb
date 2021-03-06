class TrackComponentPolicy < TrackPolicy

  def track
    record.track
  end

  def create?
    update?
  end

  class Scope < Scope

    def accessible_track_ids
      Track.joins('inner join roles where roles.resource_id = tracks.id').
        where(roles: { resource_type: 'Track', user_id: user.id }).
        pluck('tracks.id')
    end

    def resolve
    end

  end

end
