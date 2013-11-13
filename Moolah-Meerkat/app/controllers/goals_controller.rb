class GoalsController < ApplicationController

before_action :authenticated!, :current_user

  def new
    @goal = Goal.new

    render :new
  end

  def create
   
    @goal = Goal.new(goal_params)
    # add new goal to the current user
    if @goal.save
      params.keys.each do |x|
        if x.to_i > 0
          User.find(x.to_i).goals << @goal
        end
      end
      @current_user.goals << @goal
      redirect_to user_goal_path(current_user, @goal)
    else
      redirect_to new_user_goal_path(current_user)
    end
    
   # for adding connections to group goal
   # @connections = User.connections.all
   # add user's friends to new goal
   # @goal.users << params[:friend_id]
  end

  def show
    @user = User.find(params[:user_id])
    @goal = @user.goals.find(params[:id])
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
    params.require(:goal).permit(:name, :description, :deadline, :final_amount)
  end


end