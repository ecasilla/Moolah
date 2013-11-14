class ActivitiesController < ApplicationController
  
  def index
    binding.pry
    @all_activities = PublicActivity::Activity.order("created_at desc").all
  end

end
