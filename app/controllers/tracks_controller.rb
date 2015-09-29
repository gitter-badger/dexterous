class TracksController < ApplicationController

  layout 'dashboard'

  ensure_policy_application

  before_action :authenticate_user!

  def new
    @track ||= Track.new
    authorize @track
  end

  def edit
    @track = Track.friendly.find params[:id]
    authorize @track
  end

  def create
    @track = Track.new extract_params
    authorize @track
    @track.save!
    current_user.add_role :contributor, @track
    redirect_to controller: 'home', action: 'dashboard'
  rescue => e
    puts e
    puts e.backtrace
    render action: 'new'
  end

  def show
    @track = Track.includes(
      :learning_resources,
      :milestones => [:achievements]
    ).friendly.find params[:id]
    authorize @track
  end

  private

  def extract_params
    params
      .require(:track)
      .permit(:title, :description, :visibility)
  end

end
