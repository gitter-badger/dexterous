module TrackComponentSupport
  extend ActiveSupport::Concern

  included do
    helper_method :track
  end

  def track
    unless @track
      @track = Track.friendly.find(params[:track_id]) if params[:track_id]
      authorize @track, :show?
    end
    @track
  end

end
