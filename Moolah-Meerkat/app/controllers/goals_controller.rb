class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new
    # for adding connections to group goal
     @connections = User.connections.all
      # add new goal to the current user
     @user.goals << @goal
     # add user's friends to new goal
     @goal.users << params[:friend_id]
      render :new
  end

  def show
  end

  def index
  end

  def update
  end

  def edit
  end

  def destroy
  end

end