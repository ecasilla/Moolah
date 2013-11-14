class TransactionsController < ApplicationController

before_action :authenticated!, :current_user

  def new
  end

  def create
    @user = current_user
    @goal = Goal.find(params[:goal_id])
    @transaction = Transaction.new(user: @user, amount: params[:amount], description: params[:description], goal: @goal)
    @achievements = Achievement.where(user: @user, goal: @goal)
    

     if @transaction.save
      @currentAchievements = Achievement.where(user: @user, goal: @goal)
      if @achievements != @currentAchievements
         newachievement = true
         render json: [@transaction, @currentAchievements, {achievement: newachievement}]
      else
        newachievement = false
        render json: [@transaction, @currentAchievements, {achievement: newachievement}]
      end
     else  
       render nothing: true
     end
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