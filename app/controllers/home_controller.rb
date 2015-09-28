class HomeController < ApplicationController

  before_filter :authenticate_user!, only: ['dashboard']

  def index
    @public_tracks = Track.publics.limit(3)
  end

  def dashboard
    @contributed_tracks = Track.contributed_by(current_user).all
    @enrolled_tracks = Track.enrolled_by(current_user).all
  end

end
