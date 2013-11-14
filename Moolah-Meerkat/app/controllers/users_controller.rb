class UsersController < ApplicationController

before_action :authenticated!, :current_user

  def show
    @user = User.find(params[:id])
    @all_activities = PublicActivity::Activity.order("created_at desc").all
  end

  def destroy
  end
  
  def search
    query = params[:query].split(" ").each {|name| name.capitalize!}
    if query[1].nil?
      query << 'none'
    end
    @users = User.where("first_name='#{query[0]}' OR last_name='#{query[1]}'") 
  end

private

  def set_user
    @user = User.find(params[:id])
  end

end