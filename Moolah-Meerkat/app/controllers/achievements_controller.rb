class AchievementsController < ApplicationController

  def index
  	@achievements = current_user.achievements
  end

  def show
  	@achievements = current_user.achievements.find_by(params[:id])
  end

end