class AchievementsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @achievement = Achievement.create! extract_params.merge!(user: current_user)
  end

  private

  def extract_params
    params
      .require(:achievement)
      .permit(:milestone_id)
  end
  

end
