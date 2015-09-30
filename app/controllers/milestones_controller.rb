class MilestonesController < ResourcefulController

  after_action :verify_authorized
  helper_method :milestone
  helper_method :track
  layout 'dashboard'

  include TrackComponentSupport

  alias_method :milestone, :resource

  private

  def permitted_params
    %i[title description expected_duration track_id]
  end

  def build_empty_resource
    super
    resource.track = track
  end

end
