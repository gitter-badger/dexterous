class TracksController < ApplicationController

  layout 'dashboard'

  before_action :authenticate_user!

  def new
    @track ||= Track.new
  end

  def edit
    @track = Track.contributed_by(current_user).friendly.find params[:id]
  end

  def create
    @track = Track.create! extract_params
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
    head :not_found unless @model.viewable_by? current_user
  end

  private

  def extract_params
    params
      .require(:track)
      .permit(:title, :description, :visibility)
  end

end
