class GoalsController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @goal = Goal.new
    render :new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @goal = Goal.new(goal_params)
    # add new goal to the current user
    if @goal.save
      @user.goals << @goal
      redirect_to user_path(@user)
    else
      redirect_to new_user_goal_path(@user)
    end
    
   # for adding connections to group goal
   # @connections = User.connections.all
   # add user's friends to new goal
   # @goal.users << params[:friend_id]
  end

  def show
    # @user = User.find(params[:id])
    @goal = current_user.goals.find(params[:id])
  end

  def index
  end

  def update
    redirect_to user_path
  end

  def edit
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :final_amount)
  end

end