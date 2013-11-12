class UsersController < ApplicationController

before_action :authenticated!, :set_user, :authorized! 

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end
  
  def search
    query = params[:query].split(" ").each {|name| name.capitalize!}
    if query[1].nil? && query.length == 2
      query.pop
      query << 'none'
    end
    @users = User.where('first_name = ' + query[0] + ' OR ' + 'last_name = ' + query[1]) 
  end

private

  def set_user
      @user = User.find(params[:id])
  end

  def authorized!
   unless @user.id == session[:user_id]
      redirect_to user_path(session[:user_id])
   end
  end

end