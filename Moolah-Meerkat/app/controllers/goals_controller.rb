class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new
    # add new goal to the current user
    @user.goals << @goal

   # for adding connections to group goal
   # @connections = User.connections.all
   # add user's friends to new goal
   # @goal.users << params[:friend_id]
    render :new
  end

  def show
    @goal = User.goals.find(params[:id])
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