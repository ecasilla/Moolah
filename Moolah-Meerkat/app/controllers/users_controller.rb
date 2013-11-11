class UsersController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  def search
    query = params[:query].split(" ").each {|name| name.capitalize!}
    if query[1].nil?
      query.pop
      query << 'none'
    end
    @users = User.where('first_name = ' + query[0] + ' OR ' + 'last_name = ' + query[1]) 
  end

end