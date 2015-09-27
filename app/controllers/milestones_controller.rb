class MilestonesController < ApplicationController

  def new
    @milestone = Milestone.new(track_id: params[:track_id])
  end

  def create
    @milestone = Milestone.new(extract_params)
    @track = Track.contributed_by(current_user).find @milestone.track_id
    @milestone.save!
  end

  private

  def extract_params
    params
      .require(:milestone)
      .permit(:title, :description, :expected_duration, :track_id)
  end

end
