class MilestonesController < ResourcefulController

  ensure_policy_application
  helper_method :milestone

  alias_method :milestone, :resource

  private

  def permitted_params
    %i[title description expected_duration track_id]
  end

end
