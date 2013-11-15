class TransactionsController < ApplicationController

before_action :authenticated!, :current_user

  def new
  end

  def create
    @user = current_user
    @goal = Goal.find(params[:goal_id])
    @achievements = Achievement.where(user: @user, goal: @goal)
    @transaction = Transaction.new(user: @user, amount: params[:amount], description: params[:description], goal: @goal)
    

    @transaction.save
    @currentAchievements = Achievement.where(user: @user, goal: @goal)

    if @achievements.length != @currentAchievements.length
      render json: [@transaction, @currentAchievements, {achievement: true}]
    else
      render json: [@transaction, @currentAchievements, {achievement: false}]
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