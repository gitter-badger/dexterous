class MilestonesController < ApplicationController

  ensure_policy_application

  before_action :load_milestone, only: [:edit, :destroy, :update]

  def new
    @milestone = Milestone.new(track_id: params[:track_id])
    authorize @milestone
  end

  def update
    @milestone.update! extract_params
  end

  def create
    @milestone = Milestone.new(extract_params)
    @track = Track.contributed_by(current_user).find @milestone.track_id
    @milestone.save!
  end

  def edit
  end

  def destroy
    @milestone.destroy!
  end

  private

  def extract_params
    params
      .require(:milestone)
      .permit(:title, :description, :expected_duration, :track_id)
  end

  def load_milestone
    @milestone = Milestone.find params[:id]
    authorize @milestone
  end

end
