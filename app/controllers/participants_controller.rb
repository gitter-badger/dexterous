class ParticipantsController < ApplicationController

  attr_accessor :track
  helper_method :track
  before_action :load_track
  layout 'dashboard'

  private

  def load_track
    @track = Track.friendly.find params[:track_id]
  end

end
