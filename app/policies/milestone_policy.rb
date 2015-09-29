class MilestonePolicy < TrackComponentPolicy

  class Scope < Scope

    def resolve
      scope.where(track_id: accessible_track_ids)
    end

  end

end
