class ActivitiesController < ApplicationController
  
  def index
    @all_activities = PublicActivity::Activity.order("created_at desc").all
  end

end
