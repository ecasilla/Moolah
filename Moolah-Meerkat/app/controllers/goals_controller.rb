class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @user = User.find_by(params[:id])
    @goal = Goal.new(goal_params)
    # add new goal to the current user
    @user.goals << @goal
    if @goal.save
      redirect_to user_goal_path(@user, @goal)
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