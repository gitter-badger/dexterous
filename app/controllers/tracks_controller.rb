class TracksController < ApplicationController

  layout 'dashboard'

  before_action :authenticate_user!
  before_action :ensure_viewability, only: [:show]
  before_action :ensure_contributability, only: [:edit, :destroy]

  def new
    @track ||= Track.new
  end

  def edit
    @track = Track.contributed_by(current_user).friendly.find params[:id]
  end

  def create
    @track = Track.create! extract_params
    @track.contributorships.create! user: current_user, track: @model
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
    head :not_found unless @model.viewable_by? current_user
  end

  private

  def extract_params
    params
      .require(:track)
      .permit(:title, :description, :visibility)
  end

  def ensure_contributability
  end

  def ensure_viewability
  end

end
