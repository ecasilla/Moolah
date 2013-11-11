class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new
    # for adding connections to group goal
     @connections = User.connections.all
     goals. params[:friend_id]
     @user.goals << @goal
     # logic to append user's connections to Goal.new


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